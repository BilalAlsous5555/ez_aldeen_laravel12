<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::table('quran_progress', function (Blueprint $table) {
            $table->tinyInteger('juz_number')->nullable()->after('to_aya');
        });
    }

    public function down(): void
    {
        Schema::table('quran_progress', function (Blueprint $table) {
            $table->dropColumn('juz_number');
        });
    }
};
