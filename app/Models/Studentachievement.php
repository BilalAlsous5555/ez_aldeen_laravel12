<?php

namespace App\Models;

use Backpack\CRUD\app\Models\Traits\CrudTrait;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class Studentachievement extends Model
{
    use CrudTrait, HasFactory;

    protected $table = 'student_achievements';

    protected $fillable = [
        'student_id',
        'teacher_id',
        'halakat_id',
        'type',
        'surah_id',
        'juz_number',
        'achieved_at',
    ];

    protected function casts(): array
    {
        return [
            'achieved_at' => 'date',
            'juz_number' => 'integer',
        ];
    }

    // -------------------------------------------------------------------------
    // Relations
    // -------------------------------------------------------------------------

    // withTrashed() لأن الطالب أو المدرس قد يكون محذوفاً لكن الإنجاز يبقى
    public function student(): BelongsTo
    {
        return $this->belongsTo(User::class, 'student_id')->withTrashed();
    }

    public function teacher(): BelongsTo
    {
        return $this->belongsTo(User::class, 'teacher_id')->withTrashed();
    }

    public function halqa(): BelongsTo
    {
        return $this->belongsTo(Halakat::class, 'halakat_id')->withTrashed();
    }

    // surah_id = null عند juz_memorized لذلك nullable
    public function surah(): BelongsTo
    {
        return $this->belongsTo(Surah::class, 'surah_id');
    }

    // -------------------------------------------------------------------------
    // Scopes — للاستعلامات الشائعة
    // -------------------------------------------------------------------------

    public function scopeSurahsOnly($query)
    {
        return $query->where('type', 'surah_memorized');
    }

    public function scopeJuzOnly($query)
    {
        return $query->where('type', 'juz_memorized');
    }

    // -------------------------------------------------------------------------
    // Static helpers — المنطق الأساسي للإنجازات
    // -------------------------------------------------------------------------

    /**
     * يُستدعى تلقائياً بعد حفظ كل جلسة quran_progress.
     *
     * المنطق:
     * - إذا كان memorize_type = memorize
     *   AND to_aya == surah.aya_count
     *   AND لم يُسجَّل هذا الإنجاز مسبقاً
     *   → يُنشئ surah_memorized تلقائياً
     *
     * @param  QuranProgress  $progress  الجلسة المسجَّلة للتو
     */
    public static function checkAndCreateSurahAchievement(QuranProgress $progress): void
    {
        // شرط 1: يجب أن تكون جلسة حفظ وليس مراجعة
        if ($progress->memorize_type !== 'حفظ') {
            return;
        }

        // شرط 2: التقييم لا يمكن أن يكون "اعادة" (الطالب لم ينجح)
        if ($progress->evaluation === 'اعادة') {
            return;
        }

        // شرط 3: هل to_aya هي آخر آية في السورة؟
        $surah = Surah::find($progress->surah_id);
        if (! $surah || $progress->to_aya !== $surah->aya_count) {
            return;
        }

        // شرط 4: هل هذا الإنجاز مسجَّل مسبقاً؟ (لا نكرر)
        $exists = static::where('student_id', $progress->student_id)
            ->where('type', 'surah_memorized')
            ->where('surah_id', $progress->surah_id)
            ->exists();

        if ($exists) {
            return;
        }

        // إنشاء الإنجاز تلقائياً
        static::create([
            'student_id' => $progress->student_id,
            'teacher_id' => $progress->teacher_id,
            'halakat_id' => $progress->halakat_id,
            'type' => 'surah_memorized',
            'surah_id' => $progress->surah_id,
            'juz_number' => null,
            'achieved_at' => $progress->date,
        ]);
    }

    /**
     * يُستدعى يدوياً من المدرس عند الضغط على "إنهاء الجزء".
     * التعديل أو الحذف من الإدارة فقط.
     *
     * @param  int  $juzNumber  رقم الجزء 1-30
     * @param  string  $achievedAt  تاريخ الإنهاء
     */
    public static function createJuzAchievement(
        int $studentId,
        int $teacherId,
        int $halakatId,
        int $juzNumber,
        string $achievedAt
    ): static {

        // منع التكرار — الجزء لا يُسجَّل مرتين لنفس الطالب
        $exists = static::where('student_id', $studentId)
            ->where('type', 'juz_memorized')
            ->where('juz_number', $juzNumber)
            ->exists();

        if ($exists) {
            throw new \Exception("الجزء {$juzNumber} مسجَّل مسبقاً لهذا الطالب");
        }

        return static::create([
            'student_id' => $studentId,
            'teacher_id' => $teacherId,
            'halakat_id' => $halakatId,
            'type' => 'juz_memorized',
            'surah_id' => null,
            'juz_number' => $juzNumber,
            'achieved_at' => $achievedAt,
        ]);
    }
}
