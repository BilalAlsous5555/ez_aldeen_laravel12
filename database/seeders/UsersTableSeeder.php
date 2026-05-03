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
            'email' => 'admin@example.com',
            'phone' => '0500000000',
            'password' => Hash::make('password'),
            'birth_date' => '1980-01-01',
            'role' => 'admin',
        ]);

        // Teachers (10 rows)
        $teachers = [
            ['name' => 'أحمد محمد', 'email' => 'ahmed@example.com', 'phone' => '0500000001', 'birth_date' => '1985-05-15'],
            ['name' => 'فاطمة علي', 'email' => 'fatima@example.com', 'phone' => '0500000002', 'birth_date' => '1990-08-20'],
            ['name' => 'خالد عبدالله', 'email' => 'khaled@example.com', 'phone' => '0500000003', 'birth_date' => '1988-12-10'],
            ['name' => 'عمر حسن', 'email' => 'omar@example.com', 'phone' => '0500000004', 'birth_date' => '1992-03-25'],
            ['name' => 'سارة أحمد', 'email' => 'sara@example.com', 'phone' => '0500000005', 'birth_date' => '1991-07-18'],
            ['name' => 'ياسر علي', 'email' => 'yasser@example.com', 'phone' => '0500000006', 'birth_date' => '1987-11-30'],
            ['name' => 'نورة سعد', 'email' => 'noura@example.com', 'phone' => '0500000007', 'birth_date' => '1993-02-14'],
            ['name' => 'ماجد فهد', 'email' => 'majed@example.com', 'phone' => '0500000008', 'birth_date' => '1986-06-22'],
            ['name' => 'ليلى عمر', 'email' => 'laila@example.com', 'phone' => '0500000009', 'birth_date' => '1994-09-05'],
            ['name' => 'عبدالعزيز سعود', 'email' => 'abdulaziz@example.com', 'phone' => '0500000010', 'birth_date' => '1989-04-17'],
        ];

        foreach ($teachers as $teacher) {
            User::create([
                'name' => $teacher['name'],
                'email' => $teacher['email'],
                'phone' => $teacher['phone'],
                'password' => Hash::make('password'),
                'birth_date' => $teacher['birth_date'],
                'role' => 'teacher',
            ]);
        }

        // Students (10 rows)
        $students = [
            ['name' => 'عبدالرحمن سعيد', 'email' => 'abdulrahman@example.com', 'phone' => '0500000011', 'birth_date' => '2010-03-25'],
            ['name' => 'مريم أحمد', 'email' => 'mariam@example.com', 'phone' => '0500000012', 'birth_date' => '2012-07-18'],
            ['name' => 'يوسف محمد', 'email' => 'yousef@example.com', 'phone' => '0500000013', 'birth_date' => '2011-11-30'],
            ['name' => 'هدى خالد', 'email' => 'huda@example.com', 'phone' => '0500000014', 'birth_date' => '2010-05-12'],
            ['name' => 'طارق فهد', 'email' => 'tareq@example.com', 'phone' => '0500000015', 'birth_date' => '2011-08-23'],
            ['name' => 'رنا سعد', 'email' => 'rana@example.com', 'phone' => '0500000016', 'birth_date' => '2012-01-15'],
            ['name' => 'سلطان عمر', 'email' => 'sultan@example.com', 'phone' => '0500000017', 'birth_date' => '2010-09-07'],
            ['name' => 'دانة ماجد', 'email' => 'dana@example.com', 'phone' => '0500000018', 'birth_date' => '2011-12-19'],
            ['name' => 'فيصل عبدالله', 'email' => 'faisal@example.com', 'phone' => '0500000019', 'birth_date' => '2012-04-28'],
            ['name' => 'جنى ياسر', 'email' => 'jana@example.com', 'phone' => '0500000020', 'birth_date' => '2010-06-11'],
        ];

        foreach ($students as $student) {
            User::create([
                'name' => $student['name'],
                'email' => $student['email'],
                'phone' => $student['phone'],
                'password' => Hash::make('password'),
                'birth_date' => $student['birth_date'],
                'role' => 'student',
            ]);
        }
    }
}
