<?php

namespace App\Models;

use Backpack\CRUD\app\Models\Traits\CrudTrait;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;
use Illuminate\Database\Eloquent\Relations\HasMany;

class Halakat extends Model
{
    use CrudTrait;

    protected $table = 'halakat';

    protected $fillable = [
        'name',
        'notes',
        'teacher_id',
    ];

    // -------------------------------------------------------------------------
    // Relations
    // -------------------------------------------------------------------------

    /**
     * The one teacher assigned to this halqa.
     */
    public function teacher(): BelongsTo
    {
        return $this->belongsTo(User::class, 'teacher_id')->withTrashed();
    }

    // /**
    //  * All enrollment rows (including historical).
    //  */
    // public function enrollments(): HasMany
    // {
    //     return $this->hasMany(HalakatStudent::class, 'halakat_id');
    // }

    /**
     * الطلاب النشطون غير المحذوفين — للعدّ والقوائم الرسمية
     */
    public function activeStudents(): BelongsToMany
    {
        return $this->belongsToMany(User::class, 'halakat_students', 'halakat_id', 'student_id')
            ->withPivot(['joined_at', 'left_at', 'is_active'])
            ->wherePivot('is_active', true);
        // بدون withTrashed() → يستثني المحذوفين تلقائياً
    }

    /**
     * كل الطلاب التاريخيين شاملاً المحذوفين — لملف الطالب والإحصائيات التاريخية
     */
    public function allStudents(): BelongsToMany
    {
        return $this->belongsToMany(User::class, 'halakat_students', 'halakat_id', 'student_id')
            ->withPivot(['joined_at', 'left_at', 'is_active'])
            ->orderByPivot('joined_at')
            ->withTrashed(); // يشمل المحذوفين للتاريخ فقط
    }

    /** Student attendance records for this halqa */
    public function attendances(): HasMany
    {
        return $this->hasMany(Attendance::class, 'halakat_id');
    }

    /** Quran progress sessions in this halqa */
    public function progress(): HasMany
    {
        return $this->hasMany(QuranProgress::class, 'halakat_id');
    }

    /** Notes linked to this halqa */
    public function notes(): HasMany
    {
        return $this->hasMany(Note::class, 'halakat_id');
    }

    /**
     * Get the count of active students in this halqa.
     */
    public function getActiveStudentsCount()
    {
        return $this->activeStudents()->count();
    }
}
