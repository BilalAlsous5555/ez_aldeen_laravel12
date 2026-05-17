<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::table('quran_progress', function (Blueprint $table) {
            $table->json('juz_number')->nullable()->change();
        });
    }

    public function down(): void
    {
        Schema::table('quran_progress', function (Blueprint $table) {
            $table->tinyInteger('juz_number')->nullable()->change();
        });
    }
};
