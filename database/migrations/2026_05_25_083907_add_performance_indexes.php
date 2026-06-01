<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::table('users', function (Blueprint $table) {
            $table->index(['role', 'deleted_at'], 'users_role_deleted_at_index');
        });

        Schema::table('attendances', function (Blueprint $table) {
            $table->index(['attendance_date', 'status'], 'attendances_date_status_index');
        });

        Schema::table('student_achievements', function (Blueprint $table) {
            $table->index(['type', 'achieved_at'], 'achievements_type_achieved_at_index');
        });

        Schema::table('halakat_students', function (Blueprint $table) {
            $table->index(['student_id', 'is_active'], 'halakat_students_student_active_index');
        });
    }

    public function down(): void
    {
        Schema::table('users', function (Blueprint $table) {
            $table->dropIndex('users_role_deleted_at_index');
        });

        Schema::table('attendances', function (Blueprint $table) {
            $table->dropIndex('attendances_date_status_index');
        });

        Schema::table('student_achievements', function (Blueprint $table) {
            $table->dropIndex('achievements_type_achieved_at_index');
        });

        Schema::table('halakat_students', function (Blueprint $table) {
            $table->dropIndex('halakat_students_student_active_index');
        });
    }
};
