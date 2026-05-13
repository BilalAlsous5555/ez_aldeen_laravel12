<?php

use App\Http\Controllers\Admin\AccountCrudController;
use App\Http\Controllers\Admin\UserCrudController;
use Illuminate\Support\Facades\Route;

// --------------------------
// Custom Backpack Routes
// --------------------------
// This route file is loaded automatically by Backpack\CRUD.
// Routes you generate using Backpack\Generators will be placed here.

Route::group([
    'prefix' => config('backpack.base.route_prefix', 'admin'),
    'middleware' => array_merge(
        (array) config('backpack.base.web_middleware', 'web'),
        (array) config('backpack.base.middleware_key', 'admin')
    ),
    'namespace' => 'App\Http\Controllers\Admin',
], function () { // custom admin routes
    Route::crud('user', UserCrudController::class);
    Route::crud('accounts', AccountCrudController::class);
    Route::crud('halakat', 'HalakatCrudController');
    Route::get('halakat/by-role', function (\Illuminate\Http\Request $request) {
        $role = $request->input('role');
        $currentHalaka = $request->input('currentHalaka');

        if ($role === 'teacher') {
            $query = \App\Models\Halakat::whereNull('teacher_id');

            if ($currentHalaka) {
                $query->orWhere('id', $currentHalaka);
            }

            $halakat = $query->get(['id', 'name']);
        } else {
            $halakat = \App\Models\Halakat::get(['id', 'name']);
        }

        return response()->json($halakat->pluck('name', 'id'));
    })->name('halakat.byRole');
    Route::crud('pending-transfer', 'PendingTransferCrudController');
    Route::crud('quran-progress', 'QuranProgressCrudController');
    Route::crud('attendance', 'AttendanceCrudController');
    Route::crud('note', 'NoteCrudController');
    Route::crud('surah', 'SurahCrudController');
    Route::crud('quran-page', 'QuranPageCrudController');
    Route::crud('student-achievement', 'StudentAchievementCrudController');
}); // this should be the absolute last line of this file

/**
 * DO NOT ADD ANYTHING HERE.
 */
