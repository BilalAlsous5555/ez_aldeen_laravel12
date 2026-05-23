<?php

use App\Http\Controllers\UserController\ApiAttendanceController;
use App\Http\Controllers\UserController\ApiTeacherDashboardController;
use App\Http\Controllers\UserController\ApiUserController;
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

// auth routes
Route::delete('/logout', [AuthController::class, 'logout'])->middleware('auth:sanctum');
Route::post('/login', [AuthController::class, 'login']);

// teacher routes
Route::middleware('auth:sanctum')->get('/teacher/dashboard', [ApiTeacherDashboardController::class, 'dashboard']);
Route::middleware('auth:sanctum')->get('/teacher/attendance/create', [ApiAttendanceController::class, 'create']);
Route::middleware('auth:sanctum')->post('/teacher/attendance', [ApiAttendanceController::class, 'store']);

// api routes
// Route::get('/getuserdata' , [ApiUserController::class ,'index']);
