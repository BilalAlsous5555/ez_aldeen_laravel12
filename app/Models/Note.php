<?php

namespace App\Models;

use App\Models\Halakat;
use App\Models\User;
use Backpack\CRUD\app\Models\Traits\CrudTrait;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class Note extends Model
{
    use CrudTrait;
    protected $table = 'notes';

    protected $fillable = [
        'student_id',
        'sender_id',
        'halakat_id',
        'content',
    ];

    /**
     * [NEW] withTrashed على student و sender
     * الملاحظة تبقى في ملف الطالب حتى بعد حذفه
     * وتبقى منسوبة للمدرس الذي أرسلها حتى بعد نقله أو حذفه
     */
    public function student(): BelongsTo
    {
        return $this->belongsTo(User::class, 'student_id')->withTrashed();
    }

    public function sender(): BelongsTo
    {
        return $this->belongsTo(User::class, 'sender_id')->withTrashed();
    }

     // halakat_id يبقى كما هو عند soft delete للحلقة (لا nullOnDelete هنا)
    // withTrashed() لعرض اسم الحلقة في سياق الملاحظة
    public function halqa(): BelongsTo
    {
        return $this->belongsTo(Halakat::class, 'halakat_id')->withTrashed();
    }
}
