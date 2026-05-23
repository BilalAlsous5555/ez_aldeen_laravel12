<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        $fkExists = DB::selectOne(
            "SELECT COUNT(*) as cnt FROM information_schema.TABLE_CONSTRAINTS 
             WHERE TABLE_SCHEMA = DATABASE() 
             AND TABLE_NAME = 'quran_progress' 
             AND CONSTRAINT_NAME = 'quran_progress_quran_page_number_foreign' 
             AND CONSTRAINT_TYPE = 'FOREIGN KEY'"
        );

        if ($fkExists && $fkExists->cnt > 0) {
            Schema::table('quran_progress', function (Blueprint $table) {
                $table->dropForeign(['quran_page_number']);
            });
        }

        Schema::table('quran_progress', function (Blueprint $table) {
            $table->unsignedSmallInteger('quran_page_number')->nullable()->change();
        });

        if ($fkExists && $fkExists->cnt > 0) {
            Schema::table('quran_progress', function (Blueprint $table) {
                $table->foreign('quran_page_number')->references('page_number')->on('quran_pages')->onDelete('set null');
            });
        }
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
