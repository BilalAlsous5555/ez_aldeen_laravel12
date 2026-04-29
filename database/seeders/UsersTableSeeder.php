<?php

namespace Database\Seeders;

use App\Models\User;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;

class UsersTableSeeder extends Seeder
{
    public function run(): void
    {
        // Admin user (1 row)
        User::create([
            'name' => 'مدير النظام',
            'phone' => '0500000000',
            'password' => Hash::make('password'),
            'birth_date' => '1980-01-01',
            'role' => 'admin',
        ]);

        // Teachers (3 rows)
        $teachers = [
            ['name' => 'أحمد محمد', 'phone' => '0500000001', 'birth_date' => '1985-05-15'],
            ['name' => 'فاطمة علي', 'phone' => '0500000002', 'birth_date' => '1990-08-20'],
            ['name' => 'خالد عبدالله', 'phone' => '0500000003', 'birth_date' => '1988-12-10'],
        ];

        foreach ($teachers as $teacher) {
            User::create([
                'name' => $teacher['name'],
                'phone' => $teacher['phone'],
                'password' => Hash::make('password'),
                'birth_date' => $teacher['birth_date'],
                'role' => 'teacher',
            ]);
        }

        // Students (3 rows)
        $students = [
            ['name' => 'عبدالرحمن سعيد', 'phone' => '0500000004', 'birth_date' => '2010-03-25'],
            ['name' => 'مريم أحمد', 'phone' => '0500000005', 'birth_date' => '2012-07-18'],
            ['name' => 'يوسف محمد', 'phone' => '0500000006', 'birth_date' => '2011-11-30'],
        ];

        foreach ($students as $student) {
            User::create([
                'name' => $student['name'],
                'phone' => $student['phone'],
                'password' => Hash::make('password'),
                'birth_date' => $student['birth_date'],
                'role' => 'student',
            ]);
        }
    }
}
