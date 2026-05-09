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
                        // [CHANGED] من cascadeOnDelete إلى restrictOnDelete
            // السبب: لا نريد حذف سجل انتماء الطالب للحلقة عند حذفه
            //        لأن الطالب يُحذف soft delete فقط وهذه السجلات
            //        ضرورية لعرض تاريخ انتقالاته في ملفه الشخصي
            $table->foreignId('student_id')->unique()
                ->constrained('users')
                ->restrictOnDelete();

            $table->foreignId('halakat_id')
                ->constrained('halakat')
                ->restrictOnDelete();

            $table->date('joined_at');
            $table->date('left_at')->nullable();           // null = still active
                  // [NO CHANGE] منطق is_active:
            // true  = الحلقة الحالية للطالب (دائماً صف واحد فقط per student)
            // false = حلقة سابقة (الطالب انتقل منها أو غادر المعهد)
            // عملية النقل:
            //   1. تحديث الصف الحالي: is_active=false, left_at=today
            //   2. إنشاء صف جديد:    is_active=true,  joined_at=today
            $table->boolean('is_active')->default(true);

            // A student can only be ACTIVE in one halqa at a time
            // (historical rows allowed — only one row with is_active = true per student)
            // منع تكرار نفس الطالب في نفس الحلقة في نفس تاريخ الانضمام
            $table->unique(['student_id', 'halakat_id', 'joined_at'], 'unique_enrollment');
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
