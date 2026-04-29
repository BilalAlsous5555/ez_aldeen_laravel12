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
        Schema::create('attendances', function (Blueprint $table) {
            $table->id();

            $table->date('attendance_date');
            $table->enum('status', ['present', 'absent']);
            $table->string('excused_reason', 255)->nullable();

            $table->foreignId('student_id')
                ->constrained('users')
                ->cascadeOnDelete();

            $table->foreignId('halakat_id')
                ->constrained('halakat')
                ->cascadeOnDelete();

            // The teacher (or admin) who recorded this entry
            $table->foreignId('recorded_by')
                ->constrained('users')
                ->restrictOnDelete();

            $table->timestamps();

            // One attendance record per student per halqa per day
            $table->unique(['student_id', 'halakat_id', 'attendance_date'], 'unique_student_attendance');

            $table->index(['halakat_id', 'attendance_date']);
            $table->index(['student_id', 'attendance_date']);
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('attendances');
    }
};
