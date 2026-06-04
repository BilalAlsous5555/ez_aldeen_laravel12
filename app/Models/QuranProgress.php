<?php

namespace App\Models;

use Backpack\CRUD\app\Models\Traits\CrudTrait;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class QuranProgress extends Model
{
    use CrudTrait;

    protected $table = 'quran_progress';

    protected $fillable = [
        'student_id',
        'halakat_id',
        'teacher_id',
        'surah_id',
        'quran_page_number',
        'from_aya',
        'to_aya',
        'juz_number',
        'evaluation',
        'notes',
        'date',
        'memorize_type',
    ];

    protected function casts(): array
    {
        return [
            'date' => 'date',
            'from_aya' => 'integer',
            'to_aya' => 'integer',
            'juz_number' => 'array',
        ];
    }

    protected static function booted(): void
    {
        static::creating(function (self $progress) {
            if (! $progress->halakat_id && $progress->student_id) {
                $enrollment = \App\Models\HalakatStudent::with('halqa')
                    ->where('student_id', $progress->student_id)
                    ->where('is_active', true)
                    ->first();
                $progress->halakat_id = $enrollment?->halakat_id;
            }
            if (! $progress->teacher_id && $progress->halakat_id) {
                $halaka = Halakat::find($progress->halakat_id);
                $progress->teacher_id = $halaka?->teacher_id;
            }
        });

        static::created(function (self $progress) {
            if ($progress->surah_id) {
                \App\Models\Studentachievement::checkAndCreateSurahAchievement($progress);
            }

            if ($progress->juz_number && $progress->memorize_type === 'حفظ' && $progress->evaluation !== 'اعادة') {
                $juzList = is_array($progress->juz_number) ? $progress->juz_number : [$progress->juz_number];
                foreach ($juzList as $juz) {
                    try {
                        \App\Models\Studentachievement::createJuzAchievement(
                            $progress->student_id,
                            $progress->teacher_id,
                            $progress->halakat_id,
                            (int) $juz,
                            $progress->date->format('Y-m-d')
                        );
                    } catch (\Exception $e) {
                        // juz already recorded — silently skip
                    }
                }
            }
        });
    }

    // -------------------------------------------------------------------------
    // Relations
    // -------------------------------------------------------------------------

    /**
     * [NEW] withTrashed على student و teacher
     * السبب: سجلات التقدم تبقى حتى بعد حذف الطالب أو نقل المدرس
     *        ويجب عرض اسميهما في ملف الطالب وإحصائيات المعهد
     */
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

    public function surah(): BelongsTo
    {
        return $this->belongsTo(Surah::class, 'surah_id');
    }

    public function page(): BelongsTo
    {
        return $this->belongsTo(QuranPage::class, 'quran_page_number', 'page_number');
    }

    public function ayatCount(): int
    {
        return $this->to_aya - $this->from_aya + 1;
    }

    // -------------------------------------------------------------------------
    // Helpers
    // -------------------------------------------------------------------------

    // هل هذه جلسة حفظ (وليس مراجعة)؟
    public function isMemorize(): bool
    {
        return $this->memorize_type === 'حفظ';
    }

    // هل هذه جلسة مراجعة؟
    public function isRevision(): bool
    {
        return $this->memorize_type === 'مراجعة';
    }

    public function getJuzNumberFormattedAttribute(): string
    {
        $val = $this->juz_number;

        if (is_null($val) || $val === '' || $val === '[]') {
            return '—';
        }

        if (is_string($val)) {
            $arr = json_decode($val, true);
        } else {
            $arr = $val;
        }

        if (is_array($arr) && count($arr) > 0) {
            return implode('، ', array_map(fn ($n) => 'الجزء '.((int) $n), $arr));
        }

        return '—';
    }
}
