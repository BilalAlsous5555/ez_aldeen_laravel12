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
        Schema::table('quran_progress', function (Blueprint $table) {
            $table->enum('memorize_type', ['حفظ', 'مراجعة'])->default('حفظ')->after('notes');
        });
    }

    public function down(): void
    {
        Schema::table('quran_progress', function (Blueprint $table) {
            $table->dropColumn('memorize_type');
        });
    }
};
