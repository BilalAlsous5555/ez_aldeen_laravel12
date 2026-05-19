<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class HalakatStudent extends Model
{
    protected $table = 'halakat_students';

    protected $fillable = [
        'student_id',
        'halakat_id',
        'joined_at',
        'left_at',
        'is_active',
    ];

    protected function casts(): array
    {
        return [
            'joined_at' => 'date',
            'left_at' => 'date',
            'is_active' => 'boolean',
        ];
    }

    // -------------------------------------------------------------------------
    // Relations
    // -------------------------------------------------------------------------

    /**
     * [NEW] withTrashed() لأن الطالب قد يكون محذوفاً (soft delete)
     * لكن سجل انتمائه للحلقة يجب أن يظل ظاهراً
     */
    public function student(): BelongsTo
    {
        return $this->belongsTo(User::class, 'student_id')
            ->withTrashed();
    }

    public function halqa(): BelongsTo
    {
        return $this->belongsTo(Halakat::class, 'halakat_id')->withTrashed();
    }

    // -------------------------------------------------------------------------
    // Transfer logic
    // -------------------------------------------------------------------------

    /**
     * [NO CHANGE في المنطق — تعليق محدَّث]
     *
     * نقل طالب من حلقته الحالية إلى حلقة جديدة.
     *
     * النتيجة في قاعدة البيانات:
     * BEFORE:
     *   student_id=5, halakat_id=2, joined_at=2024-09-01, left_at=NULL,  is_active=TRUE
     *
     * AFTER:
     *   student_id=5, halakat_id=2, joined_at=2024-09-01, left_at=TODAY, is_active=FALSE ← حلقة قديمة
     *   student_id=5, halakat_id=4, joined_at=TODAY,      left_at=NULL,  is_active=TRUE  ← حلقة جديدة
     *
     * @param  string  $date  تاريخ النقل (عادةً today())
     */
    public static function transfer(int $studentId, int $newHalakatId, string $date): self
    {
        // 0. الحصول على معرف الحلقة القديمة قبل إغلاقها
        $oldEnrollment = static::where('student_id', $studentId)
            ->where('is_active', true)
            ->first();
        $oldHalakatId = $oldEnrollment?->halakat_id;

        // 1. إغلاق الحلقة الحالية
        static::where('student_id', $studentId)
            ->where('is_active', true)
            ->update([
                'is_active' => false,
                'left_at' => $date,
            ]);

        // 2. فتح حلقة جديدة
        $newEnrollment = static::create([
            'student_id' => $studentId,
            'halakat_id' => $newHalakatId,
            'joined_at' => $date,
            'is_active' => true,
        ]);

        // 3. حذف سجلات المراجعة القديمة (لا تهم المدرس الجديد)
        if ($oldHalakatId) {
            \App\Models\QuranProgress::where('student_id', $studentId)
                ->where('halakat_id', $oldHalakatId)
                ->where('memorize_type', 'مراجعة')
                ->delete();
        }

        return $newEnrollment;
    }
}
