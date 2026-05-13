<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('student_achievements', function (Blueprint $table) {
            $table->id();

            // الطالب صاحب الإنجاز
            $table->foreignId('student_id')
                ->constrained('users')
                ->restrictOnDelete();

            // المدرس الذي كان يُدرّسه عند تحقق الإنجاز — للتاريخ
            $table->foreignId('teacher_id')
                ->constrained('users')
                ->restrictOnDelete();

            // الحلقة التي تحقق فيها الإنجاز
            $table->foreignId('halakat_id')
                ->constrained('halakat')
                ->restrictOnDelete();

            // نوع الإنجاز:
            // surah_memorized → أنهى سورة كاملة (تلقائي عند to_aya == aya_count)
            // juz_memorized   → أنهى جزءاً كاملاً (يدوي من المدرس، تعديله من الإدارة)
            $table->enum('type', ['surah_memorized', 'juz_memorized']);

            // surah_id مملوء عند type = surah_memorized، null عند juz_memorized
            $table->foreignId('surah_id')
                ->nullable()
                ->constrained('surah')
                ->restrictOnDelete();

            // juz_number مملوء عند type = juz_memorized، null عند surah_memorized
            // لا نربطه بـ FK لأن الجزء ليس جدولاً — رقم من 1 إلى 30 فقط
            $table->unsignedTinyInteger('juz_number')->nullable();

            // تاريخ تحقق الإنجاز (يُأخذ من تاريخ جلسة quran_progress)
            $table->date('achieved_at');

            $table->timestamps();

            // منع تكرار نفس الإنجاز للطالب
            // طالب لا يمكن أن يُسجَّل له نفس السورة مرتين
            $table->unique(['student_id', 'type', 'surah_id'],  'unique_surah_achievement');
            // طالب لا يمكن أن يُسجَّل له نفس الجزء مرتين
            $table->unique(['student_id', 'type', 'juz_number'], 'unique_juz_achievement');

            // indexes للاستعلامات الشائعة في ملف الطالب
            $table->index(['student_id', 'type']);
            $table->index(['student_id', 'achieved_at']);
            $table->index('teacher_id');
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('student_achievements');
    }
};
