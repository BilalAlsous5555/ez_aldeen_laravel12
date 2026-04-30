<?php

namespace App\Models;

use App\Models\Attendance;
use App\Models\Halakat;
use App\Models\HalakatStudent;
use App\Models\QuranProgress;
use Backpack\CRUD\app\Models\Traits\CrudTrait;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\Relations\HasOne;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;

class User extends Authenticatable
{
    use CrudTrait;

    /** @use HasFactory<\Database\Factories\UserFactory> */
    use HasFactory, Notifiable , HasApiTokens;

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
    // STUDENT relations
    // -------------------------------------------------------------------------

    /**
     * All halakat enrollments (including historical/transferred ones).
     */
    public function enrollments(): HasMany
    {
        return $this->hasMany(HalakatStudent::class, 'student_id');
    }

    /**
     * Current active halqa the student belongs to.
     */
    public function activeEnrollment(): HasOne
    {
        return $this->hasOne(HalakatStudent::class, 'student_id')
            ->where('is_active', true)
            ->latestOfMany('joined_at');
    }

    /**
     * All halakat the student has ever been in (via pivot).
     */
    public function halakat(): BelongsToMany
    {
        return $this->belongsToMany(Halakat::class, 'halakat_students', 'student_id', 'halakat_id')
            ->withPivot(['joined_at', 'left_at', 'is_active'])
            ->orderByPivot('joined_at');
    }

    /** Student's Quran progress records */
    public function progress(): HasMany
    {
        return $this->hasMany(QuranProgress::class, 'student_id');
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
    public function progressByTeacher(): HasMany
    {
        return $this->hasMany(QuranProgress::class, 'student_id')
            ->with('teacher')
            ->orderBy('date');
    }

    /** Student's attendance records */
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
    // Student profile summary — what each teacher taught this student
    // -------------------------------------------------------------------------

    /**
     * Returns a summary per teacher:
     * [
     *   [ 'teacher' => User, 'sessions' => int, 'juz_covered' => [...], 'pages' => int ]
     * ]
     */
    public function teacherSummary(): \Illuminate\Support\Collection
    {
        return $this->progress()
            ->with(['teacher', 'page'])
            ->get()
            ->groupBy('teacher_id')
            ->map(function ($sessions, $teacherId) {
                return [
                    'teacher'      => $sessions->first()->teacher,
                    'sessions'     => $sessions->count(),
                    'pages_count'  => $sessions->unique('quran_page_number')->count(),
                    'juz_covered'  => $sessions->pluck('page.juz_number')
                        ->unique()
                        ->sort()
                        ->values(),
                    'first_date'   => $sessions->min('date'),
                    'last_date'    => $sessions->max('date'),
                ];
            })
            ->values();
    }

    // Accessor to get arabic role
    public function getArabicRoleAttribute() // invoke by $user->arabic_role
    {
        $roles =[
            'teacher' => 'مدرس',
            'student' => 'طالب',
            'admin' => 'مدير'
        ];
        return $roles[$this->role] ?? $this->role ;
    }


}
