<?php

namespace App\Models;

use App\Models\Halakat;
use App\Models\QuranPage;
use App\Models\Surah;
use App\Models\User;
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
        'evaluation',
        'notes',
        'date',
    ];

    protected function casts(): array
    {
        return [
            'date'      => 'date',
            'from_aya'  => 'integer',
            'to_aya'    => 'integer',
        ];
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
        return $this->belongsTo(Halakat::class, 'halakat_id');
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
}
