<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    public function run(): void
    {
        $this->call([
            SurahSeeder::class,
            QuranPagesSeeder::class,
            UsersTableSeeder::class,
            HalakatTableSeeder::class,
            HalakatStudentsTableSeeder::class,
            QuranProgressTableSeeder::class,
            AttendancesTableSeeder::class,
            NotesTableSeeder::class,
        ]);
    }
}
