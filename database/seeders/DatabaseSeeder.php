<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class DatabaseSeeder extends Seeder
{
    public function run(): void
    {
        // Clear tables in correct order (respecting foreign keys)
        DB::statement('SET FOREIGN_KEY_CHECKS=0');
        DB::table('notes')->truncate();
        DB::table('attendances')->truncate();
        DB::table('student_achievements')->truncate();
        DB::table('quran_progress')->truncate();
        DB::table('halakat_students')->truncate();
        DB::table('halakat')->truncate();
        DB::table('quran_pages')->truncate();
        DB::table('surah')->truncate();
        DB::table('users')->truncate();
        DB::table('personal_access_tokens')->truncate();
        DB::statement('SET FOREIGN_KEY_CHECKS=1');
        $this->call(
            AdminUserSeeder::class
        );
        $this->call([
            SurahSeeder::class,
            QuranPagesSeeder::class,
            UsersTableSeeder::class,
            HalakatTableSeeder::class,
            HalakatStudentsTableSeeder::class,
            QuranProgressTableSeeder::class,
            StudentAchievementsTableSeeder::class,
            AttendancesTableSeeder::class,
            NotesTableSeeder::class,
        ]);
    }
}
