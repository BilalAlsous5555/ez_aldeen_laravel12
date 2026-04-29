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
        Schema::create('quran_pages', function (Blueprint $table) {
            $table->unsignedSmallInteger('page_number')->primary(); // 1-604
            $table->unsignedTinyInteger('juz_number');              // 1-30
            $table->string('juz_name', 45);
            // No timestamps — static Quran data
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('quran_pages');
    }
};
