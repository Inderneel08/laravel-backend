<?php

use App\Http\Controllers\ApiController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

Route::post('/api/auth/login',[ApiController::class,'login'])->name('login');

Route::post('/api/auth/register',[ApiController::class,'register'])->name('register');



Route::middleware('custom.token')->group(function(){
    Route::get('/api/auth/check',function(){
        return response()->json(['message' => 'You are authenticated']);
    });

    Route::post('/api/logout',[ApiController::class, 'logout'])->name('logout');
});
