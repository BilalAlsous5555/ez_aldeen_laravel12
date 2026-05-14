<?php

namespace App\Models;

use Backpack\CRUD\app\Models\Traits\CrudTrait;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\Relations\HasOne;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;

class User extends Authenticatable
{
    use CrudTrait;

    /** @use HasFactory<\Database\Factories\UserFactory> */
    use HasApiTokens, HasFactory, Notifiable, SoftDeletes;

    /**
     * The attributes that are mass assignable.
     *
     * @var list<string>
     */
    protected $fillable = [
        'name',
        'email',
        'phone',
        'password',
        'birth_date',
        'role',
    ];

    /**
     * The attributes that should be hidden for serialization.
     *
     * @var list<string>
     */
    protected $hidden = [
        'password',
        'remember_token',
    ];

    /**
     * Get the attributes that should be cast.
     *
     * @return array<string, string>
     */
    protected function casts(): array
    {
        return [
            'email_verified_at' => 'datetime',
            'birth_date' => 'date',
            // 'password' => 'hashed',
        ];
    }
    // -------------------------------------------------------------------------
    // Role helpers
    // -------------------------------------------------------------------------

    public function isAdmin(): bool
    {
        return $this->role === 'admin';
    }

    public function isTeacher(): bool
    {
        return $this->role === 'teacher';
    }

    public function isStudent(): bool
    {
        return $this->role === 'student';
    }
    // -------------------------------------------------------------------------
    // Events — booted()
    // -------------------------------------------------------------------------

    protected static function booted(): void
    {
        // عند حذف مدرس (soft delete) → حذف حلقته soft تلقائياً
        // هذا يُطلق سلسلة:
        //   1. المدرس يُحذف soft
        //   2. حلقته تُحذف soft
        //   3. طلاب الحلقة يبقون is_active=true بدون حلقة فعلية
        //   4. الإدارة تراهم كـ "طلاب بدون حلقة" وتنقلهم
        static::deleting(function (User $user) {
            if ($user->isTeacher() && ! $user->isForceDeleting()) {
                $user->halqa?->delete(); // soft delete للحلقة
            }
        });

        // عند استعادة مدرس محذوف → لا تُستعاد حلقته السابقة
        // المدرس يُعاد تعيينه لحلقة جديدة يدوياً من الإدارة
        // (لا نفعل شيئاً عند restore — الحلقة تبقى محذوفة)
    }

    // -------------------------------------------------------------------------
    // TEACHER relations
    // -------------------------------------------------------------------------

    /**
     * The single halqa this teacher runs.
     * (UNIQUE on halakat.teacher_id enforces one-to-one at DB level)
     */
    public function halqa(): HasOne
    {
        return $this->hasOne(Halakat::class, 'teacher_id');
    }

    /** Attendance records the teacher recorded (as recorder) */
    public function recordedAttendances(): HasMany
    {
        return $this->hasMany(Attendance::class, 'recorded_by'); // recorded_by is a teacher
    }

    /** Progress sessions this teacher recorded */

    /** جلسات التقدم القرآني التي سجّلها هذا المدرس */
    public function taughtProgress(): HasMany
    {
        return $this->hasMany(QuranProgress::class, 'teacher_id');
    }

    /** Notes sent by this teacher (or admin) */
    public function sentNotes(): HasMany
    {
        return $this->hasMany(Note::class, 'sender_id');
    }

    // -------------------------------------------------------------------------
    // TEACHER — نقل المدرس لحلقة أخرى
    // -------------------------------------------------------------------------

    /**
     * [NEW] نقل المدرس من حلقته الحالية إلى حلقة جديدة.
     *
     * الخطوات:
     * 1. تعيين teacher_id = null في الحلقة القديمة (تصبح بدون مدرس)
     * 2. تعيين teacher_id = this->id في الحلقة الجديدة
     *
     * ملاحظة: UNIQUE على teacher_id يمنع ربط مدرس بأكثر من حلقة
     */
    public function transferToHalqa(int $newHalakatId): void
    {
        // تفريغ الحلقة القديمة
        Halakat::where('teacher_id', $this->id)
            ->update(['teacher_id' => null]);

        // ربط المدرس بالحلقة الجديدة
        Halakat::where('id', $newHalakatId)
            ->whereNull('deleted_at')   // لا يُنقل لحلقة محذوفة
            ->whereNull('teacher_id')   // لا يُنقل لحلقة لديها مدرس
            ->update(['teacher_id' => $this->id]);
    }

    // -------------------------------------------------------------------------
    // STUDENT relations
    // -------------------------------------------------------------------------

    /**
     * All halakat enrollments (including historical/transferred ones).
     */
    /**
     * كل سجلات انتماء الطالب للحلقات (الحالية والتاريخية).
     * [NO CHANGE] — هذه السجلات لا تُحذف حتى بعد soft delete للطالب
     */
    public function enrollments(): HasMany
    {
        return $this->hasMany(HalakatStudent::class, 'student_id');
    }

    /**
     * Current active halqa the student belongs to.
     */
    /**
     * الحلقة الحالية للطالب فقط.
     * [NO CHANGE] — دائماً صف واحد is_active = true لكل طالب
     */
    public function activeEnrollment(): HasOne
    {
        return $this->hasOne(HalakatStudent::class, 'student_id')
            ->where('is_active', true);
    }

    /**
     * All halakat the student has ever been in (via pivot).
     */
    public function halakat(): BelongsToMany
    {
        return $this->belongsToMany(Halakat::class, 'halakat_students', 'student_id', 'halakat_id')
            ->withPivot(['joined_at', 'left_at', 'is_active'])
            ->orderByPivot('joined_at')
            ->withTrashed();
    }

    /** Student's Quran progress records */
    /** كل سجلات التقدم القرآني للطالب */
    public function progress(): HasMany
    {
        return $this->hasMany(QuranProgress::class, 'student_id');
    }

    // -------------------------------------------------------------------------
    // STUDENT — الإنجازات
    // -------------------------------------------------------------------------

    /** كل إنجازات الطالب (سور وأجزاء) */
    public function achievements(): HasMany
    {
        return $this->hasMany(StudentAchievement::class, 'student_id');
    }

    /** السور المحفوظة فقط */
    public function memorizedSurahs(): HasMany
    {
        return $this->hasMany(StudentAchievement::class, 'student_id')
            ->where('type', 'surah_memorized')
            ->with('surah')
            ->orderBy('achieved_at');
    }

    /** الأجزاء المحفوظة فقط */
    public function memorizedJuz(): HasMany
    {
        return $this->hasMany(StudentAchievement::class, 'student_id')
            ->where('type', 'juz_memorized')
            ->orderBy('juz_number');
    }

    /** ملخص سريع للإنجازات */
    public function achievementsSummary(): array
    {
        return [
            'surahs_count' => $this->achievements()->surahsOnly()->count(),
            'juz_count' => $this->achievements()->juzOnly()->count(),
            'juz_numbers' => $this->achievements()->juzOnly()->pluck('juz_number')->sort()->values(),
        ];
    }

    /**
     * Progress grouped by teacher — used for the student profile page.
     * Returns a collection keyed by teacher_id.
     *
     * Usage:
     *   $student->progressByTeacher()
     *           ->with('teacher', 'surah', 'page')
     *           ->get()
     *           ->groupBy('teacher_id');
     */
    // public function progressByTeacher(): HasMany
    // {
    //     return $this->hasMany(QuranProgress::class, 'student_id')
    //         ->with('teacher')
    //         ->orderBy('date');
    // }

    /** Student's attendance records */
    /** سجلات الحضور والغياب للطالب */
    public function attendances(): HasMany
    {
        return $this->hasMany(Attendance::class, 'student_id');
    }

    /** Notes received by this student */
    public function receivedNotes(): HasMany
    {
        return $this->hasMany(Note::class, 'student_id')
            ->latest();
    }
    // -------------------------------------------------------------------------
    // Helpers — طلاب بدون حلقة فعلية (فترة انتقالية)
    // -------------------------------------------------------------------------

    /**
     * هل الطالب بدون حلقة فعلية حالياً؟
     * يحدث عند حذف الحلقة soft قبل نقل الطالب
     */
    public function hasNoActiveHalqa(): bool
    {
        $enrollment = $this->activeEnrollment()->with('halqa')->first();

        return $enrollment === null || $enrollment->halqa?->trashed();
    }

    // -------------------------------------------------------------------------
    // Student profile summary — what each teacher taught this student
    // -------------------------------------------------------------------------

    /**
     * Returns a summary per teacher:
     * [
     *   [ 'teacher' => User, 'sessions' => int, 'juz_covered' => [...], 'pages' => int ]
     * ]
     */
    // public function teacherSummary(): \Illuminate\Support\Collection
    // {
    //     return $this->progress()
    //         ->with(['teacher', 'page'])
    //         ->get()
    //         ->groupBy('teacher_id')
    //         ->map(function ($sessions, $teacherId) {
    //             return [
    //                 'teacher' => $sessions->first()->teacher,
    //                 'sessions' => $sessions->count(),
    //                 'pages_count' => $sessions->unique('quran_page_number')->count(),
    //                 'juz_covered' => $sessions->pluck('page.juz_number')
    //                     ->unique()
    //                     ->sort()
    //                     ->values(),
    //                 'first_date' => $sessions->min('date'),
    //                 'last_date' => $sessions->max('date'),
    //             ];
    //         })
    //         ->values();
    // }

    // Accessor to get arabic role
    public function getArabicRoleAttribute() // invoke by $user->arabic_role
    {
        $roles = [
            'teacher' => 'مدرس',
            'student' => 'طالب',
            'admin' => 'مدير',
        ];

        return $roles[$this->role] ?? $this->role;
    }

    // Accessor for active halqa name (used in CRUD column)
    public function getActiveHalqaName()
    {
        if ($this->isTeacher()) {
            $halqa = $this->halqa;
            if (! $halqa) {
                return '-';
            }

            return $halqa->trashed() ? "{$halqa->name} (محذوفة)" : $halqa->name;
        }

        $enrollment = $this->activeEnrollment()->with('halqa')->first();
        if (! $enrollment || ! $enrollment->halqa) {
            return '-';
        }

        if ($enrollment->halqa->trashed()) {
            return request('filter') === 'active_students' ? '-' : "{$enrollment->halqa->name} (محذوفة)";
        }

        return $enrollment->halqa->name;
    }

    // Accessor for active halqa teacher name (used in CRUD column)
    public function getActiveHalqaTeacherName()
    {
        $enrollment = $this->activeEnrollment()->with('halqa.teacher')->first();
        if (! $enrollment || ! $enrollment->halqa || ! $enrollment->halqa->teacher) {
            return '-';
        }

        if ($enrollment->halqa->teacher->trashed()) {
            return request('filter') === 'active_students' ? '-' : $enrollment->halqa->teacher->name;
        }

        return $enrollment->halqa->teacher->name;
    }
    /**
     * [UPDATED] ملخص ما أنجزه الطالب مع كل مدرس.
     *
     * يعمل حتى بعد soft delete للمدرس أو الطالب لأن:
     * - quran_progress يحتفظ بـ teacher_id حتى بعد نقل المدرس
     * - withTrashed() يجلب المدرسين المحذوفين أيضاً لعرض تاريخ كامل
     *
     * المنطق:
     * - إذا أنهى الطالب كل صفحات الجزء → "أنهى الجزء X بنجاح ✅"
     * - إذا أنهى جزءاً من الجزء      → "وصل إلى الصفحة X من الجزء Y"
     * - يدعم حفظ غير متسلسل (جزء عم ثم البقرة)
     */
    // public function teacherSummary(): \Illuminate\Support\Collection
    // {
    //     // جلب كل صفحات القرآن مرة واحدة لتجنب N+1 queries
    //     $allPages = QuranPage::all()->keyBy('page_number');

    //     // تجميع صفحات كل جزء
    //     $pagesByJuz = $allPages->groupBy('juz_number')
    //         ->map(fn($pages) => $pages->pluck('page_number'));

    //     return $this->progress()
    //         ->with([
    //             'teacher' => fn($q) => $q->withTrashed(), // [NEW] يشمل المدرسين المحذوفين
    //             'page',
    //         ])
    //         ->get()
    //         ->groupBy('teacher_id')
    //         ->map(function ($sessions) use ($pagesByJuz) {

    //             // تجميع الصفحات المغطاة حسب الجزء
    //             $coveredByJuz = $sessions
    //                 ->groupBy(fn($s) => $s->page?->juz_number)
    //                 ->filter(fn($_, $juz) => !is_null($juz))
    //                 ->map(function ($juzSessions, $juzNumber) use ($pagesByJuz) {

    //                     $coveredPages  = $juzSessions->pluck('quran_page_number')->unique();
    //                     $allJuzPages   = $pagesByJuz[$juzNumber] ?? collect();
    //                     $isCompleted   = $coveredPages->count() === $allJuzPages->count();
    //                     $maxPage       = $coveredPages->max();

    //                     return [
    //                         'juz_number' => $juzNumber,
    //                         'completed'  => $isCompleted,
    //                         'max_page'   => $maxPage,
    //                         'text'       => $isCompleted
    //                             ? "أنهى الجزء {$juzNumber} بنجاح ✅"
    //                             : "وصل إلى الصفحة {$maxPage} من الجزء {$juzNumber}",
    //                     ];
    //                 })
    //                 ->sortBy('juz_number')
    //                 ->values();

    //             return [
    //                 'teacher'     => $sessions->first()->teacher, // قد يكون محذوفاً (soft)
    //                 'sessions'    => $sessions->count(),
    //                 'first_date'  => $sessions->min('date'),
    //                 'last_date'   => $sessions->max('date'),
    //                 'juz_details' => $coveredByJuz,
    //             ];
    //         })
    //         ->values();
    // }
}
