<?php

namespace App\Models;

use Backpack\CRUD\app\Models\Traits\CrudTrait;
use Illuminate\Database\Eloquent\Model;

class Surah extends Model
{
    use CrudTrait;
    public $timestamps = false;

    protected $table = 'surah';

    protected $fillable = ['name', 'number', 'aya_count'];

    public function progress(): \Illuminate\Database\Eloquent\Relations\HasMany
    {
        return $this->hasMany(QuranProgress::class, 'surah_id');
    }
}
