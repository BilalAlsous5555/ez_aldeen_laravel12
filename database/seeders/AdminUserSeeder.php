<?php

namespace Database\Seeders;

use App\Models\User;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;

class AdminUserSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        User::create([
            'name' => 'مدير النظام',
            'email' => 'moder@ezaldeen.com',
            'phone' =>'0997176570',
            'password' => Hash::make('1122ezaldeenX2026'),
            'birth_date' => '2001-01-01',
            'role' => 'admin',
        ]);
        User::create([
            'name' => 'مديرة النظام',
            'email' => 'modera@ezaldeen.com',
            'phone' =>'0000000000',
            'password' => Hash::make('1122ezaldeenX2026'),
            'birth_date' => '2001-01-01',
            'role' => 'admin',
        ]);
        User::create([
            'name' => 'مدير النظام',
            'email' => 'moder1@ezaldeen.com',
            'phone' =>'0000000000',
            'password' => Hash::make('1122ezaldeenX2026'),
            'birth_date' => '2001-01-01',
            'role' => 'admin',
        ]);
    }
}
