<?php

namespace App\Http\Controllers\Users\Api\Auth;


use App\Http\Controllers\Controller;
use App\Http\Requests\AuthRequest\LoginRequest;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class AuthController extends Controller
{
    public function login(LoginRequest $request)
    {
        if(!Auth::attempt($request->validated()))
        {
            return response()->json(['message'=>'Invalid email or password'] ,401 );
        }
        else
        {
            $user = User::where('email',$request->email)->first();
            $token = $user->createToken('auth_Token')->plainTextToken;
            return response()->json([
                'message'=>'User Loged in successfully ! ',
                'token' => $token ,
                'user' => $user ,
            ],201);
        }
    }

    public function logout(Request $request)
    {
        $request->user()->currentAccessToken()->delete();
        return response()->json([
            'message'=>'User LogOut Successfully'
        ]);
    }
}

