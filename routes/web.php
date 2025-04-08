<?php

use App\Http\Controllers\ApiController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

Route::post('/api/login',[ApiController::class,'login'])->name('login');

Route::post('/api/register',[ApiController::class,'register'])->name('register');

Route::middleware('custom.token')->group(function(){
    // Route::get('/user',function(){

    // });

    Route::post('/api/logout',[ApiController::class, 'logout'])->name('logout');
});
