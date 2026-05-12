<?php

namespace App\Models;

use App\Models\Halakat;
use App\Models\User;
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
