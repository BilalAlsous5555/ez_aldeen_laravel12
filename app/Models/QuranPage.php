<?php

namespace App\Models;

use Backpack\CRUD\app\Models\Traits\CrudTrait;
use Illuminate\Database\Eloquent\Model;

class QuranPage extends Model
{
    use CrudTrait;

    public $incrementing = false;
    public $timestamps  = false;

    protected $table = 'quran_pages';
    protected $primaryKey = 'page_number';
    protected $keyType = 'int';

    protected $fillable = ['page_number', 'juz_number', 'juz_name'];

    public function progress(): \Illuminate\Database\Eloquent\Relations\HasMany
    {
        return $this->hasMany(QuranProgress::class, 'quran_page_number', 'page_number');
    }

}
