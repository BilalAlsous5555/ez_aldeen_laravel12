<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::table('quran_progress', function (Blueprint $table) {
            $table->dropForeign(['quran_page_number']);
            $table->smallInteger('quran_page_number')->nullable()->change();
            $table->foreign('quran_page_number')->references('page_number')->on('quran_pages')->onDelete('set null');
        });
    }

    public function down(): void
    {
        Schema::table('quran_progress', function (Blueprint $table) {
            $table->dropForeign(['quran_page_number']);
            $table->smallInteger('quran_page_number')->nullable(false)->change();
            $table->foreign('quran_page_number')->references('page_number')->on('quran_pages');
        });
    }
};
