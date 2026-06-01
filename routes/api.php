<?php

use App\Http\Controllers\UserController\ApiAttendanceController;
use App\Http\Controllers\UserController\ApiQuranProgressController;
use App\Http\Controllers\UserController\ApiTeacherDashboardController;
use App\Http\Controllers\Users\Api\Auth\AuthController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

Route::get('/status', function () {
    return response()->json([
        'status' => 'success',
        'message' => 'API is working',
        'timestamp' => now(),
    ]);
});

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

Route::delete('/logout', [AuthController::class, 'logout'])->middleware('auth:sanctum');
Route::post('/login', [AuthController::class, 'login']);

Route::middleware('auth:sanctum')->group(function () {
    Route::get('/teacher/dashboard', [ApiTeacherDashboardController::class, 'dashboard']);
    Route::get('/teacher/attendance/create', [ApiAttendanceController::class, 'create']);
    Route::post('/teacher/attendance', [ApiAttendanceController::class, 'store']);
    Route::get('/teacher/quran-progress/create', [ApiQuranProgressController::class, 'create']);
    Route::post('/teacher/quran-progress', [ApiQuranProgressController::class, 'store']);
    Route::get('/teacher/quran-progress/history', [ApiQuranProgressController::class, 'history']);
});
