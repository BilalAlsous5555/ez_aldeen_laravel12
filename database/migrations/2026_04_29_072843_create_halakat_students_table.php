<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('halakat_students', function (Blueprint $table) {
            $table->id();
            $table->foreignId('student_id')
                    ->constrained('users')
                    ->cascadeOnDelete();

            $table->foreignId('halakat_id')
                    ->constrained('halakat')
                    ->cascadeOnDelete();
            
            $table->date('joined_at');
            $table->date('left_at')->nullable();           // null = still active
            $table->boolean('is_active')->default(true);
            
            // A student can only be ACTIVE in one halqa at a time
            // (historical rows allowed — only one row with is_active = true per student)
            $table->unique(['studen_id','halakat_id','joined_at'],'unique_enrollment');
            $table->timestamps();
            $table->index('student_id');
            $table->index('halakat_id');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('halakat_students');
    }
};
