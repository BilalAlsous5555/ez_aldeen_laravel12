<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('quran_progress', function (Blueprint $table) {
            $table->id();

            $table->foreignId('student_id')
                ->constrained('users')
                ->restrictOnDelete();

            $table->foreignId('halakat_id')
                ->constrained('halakat')
                ->restrictOnDelete();

            // teacher_id kept for historical tracking
            // (shows which teacher recorded this progress session)
            $table->foreignId('teacher_id')
                ->constrained('users')
                ->restrictOnDelete();

            $table->foreignId('surah_id')
                ->constrained('surah')
                ->restrictOnDelete();

            $table->unsignedSmallInteger('quran_page_number');
            $table->foreign('quran_page_number')
                ->references('page_number')
                ->on('quran_pages')
                ->restrictOnDelete();

            $table->unsignedSmallInteger('from_aya')->nullable();
            $table->unsignedSmallInteger('to_aya')->nullable();

            $table->enum('evaluation', ['ممتاز', 'جيد جدا', 'جيد', 'اعادة'])->nullable();
            $table->string('notes', 255)->nullable();
            // [NEW] نوع الجلسة:
            // memorize  → حفظ جديد — يُفعّل التحقق من إنهاء السورة تلقائياً
            // revision  → مراجعة فقط — لا يُنشئ أي إنجاز في student_achievements
            $table->enum('memorize_type', ['حفظ', 'مراجعة'])->default('حفظ');
            $table->date('date');
            $table->timestamps();

            // Indexes for the student-profile history query
            $table->index(['student_id', 'teacher_id']);
            $table->index(['student_id', 'halakat_id']);
            $table->index('date');

        });
        DB::statement('ALTER TABLE quran_progress ADD CONSTRAINT check_ayah_range CHECK (from_aya <= to_aya)');
    }

    public function down(): void
    {
        Schema::dropIfExists('quran_progress');
    }
};
