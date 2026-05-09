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
        Schema::table('halakat_students', function (Blueprint $table) {
            $table->dropUnique('halakat_students_student_id_unique');
        });
    }

    public function down(): void
    {
        Schema::table('halakat_students', function (Blueprint $table) {
            $table->unique('student_id');
        });
    }
};
