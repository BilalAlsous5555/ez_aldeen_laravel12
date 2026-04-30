<?php

namespace App\Models;

use App\Models\Halakat;
use App\Models\User;
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
            'left_at'   => 'date',
            'is_active' => 'boolean',
        ];
    }

    // -------------------------------------------------------------------------
    // Relations
    // -------------------------------------------------------------------------

    public function student(): BelongsTo
    {
        return $this->belongsTo(User::class, 'student_id');
    }

    public function halqa(): BelongsTo
    {
        return $this->belongsTo(Halakat::class, 'halakat_id');
    }

    // -------------------------------------------------------------------------
    // Helpers
    // -------------------------------------------------------------------------

    /**
     * Transfer a student to a new halqa.
     * Closes the current enrollment and opens a new one.
     */
    public static function transfer(int $studentId, int $newHalakatId, string $date): self
    {
        // Close current active enrollment
        static::where('student_id', $studentId)
            ->where('is_active', true)
            ->update([
                'is_active' => false,
                'left_at'   => $date,
            ]);

        // Open new enrollment
        return static::create([
            'student_id'  => $studentId,
            'halakat_id'  => $newHalakatId,
            'joined_at'   => $date,
            'is_active'   => true,
        ]);
    }
}
