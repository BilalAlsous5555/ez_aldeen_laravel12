<?php

namespace App\Models;

use Backpack\CRUD\app\Models\Traits\CrudTrait;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class Attendance extends Model
{
    use CrudTrait;

    protected $table = 'attendances';

    protected $fillable = [
        'attendance_date',
        'status',
        'excused_reason',
        'student_id',
        'halakat_id',
        'recorded_by',
    ];

    protected function casts(): array
    {
        return [
            'attendance_date' => 'date',
        ];
    }

    protected static function booted(): void
    {
        static::creating(function (self $attendance) {
            if (! $attendance->halakat_id && $attendance->student_id) {
                $enrollment = \App\Models\HalakatStudent::where('student_id', $attendance->student_id)
                    ->where('is_active', true)
                    ->first();
                $attendance->halakat_id = $enrollment?->halakat_id;
            }
            if (! $attendance->recorded_by) {
                $attendance->recorded_by = backpack_auth()->id();
            }
        });
    }

    /**
     * [NEW] withTrashed — الطالب قد يكون محذوفاً لكن سجلاته تبقى
     */
    public function student(): BelongsTo
    {
        return $this->belongsTo(User::class, 'student_id')->withTrashed();
    }

    public function halqa(): BelongsTo
    {
        return $this->belongsTo(Halakat::class, 'halakat_id')->withTrashed();
    }

    /**
     * [NEW] withTrashed — المدرس الذي سجّل الحضور قد يكون انتقل أو حُذف
     */
    public function recorder(): BelongsTo
    {
        return $this->belongsTo(User::class, 'recorded_by')->withTrashed();
    }
}
