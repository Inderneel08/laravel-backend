<?php

use App\Http\Controllers\ApiController;
use App\Http\Controllers\ProductController;
use Illuminate\Support\Facades\Route;

Route::post('/api/auth/login',[ApiController::class,'login'])->name('login');

Route::post('/api/auth/register',[ApiController::class,'register'])->name('register');

Route::get('/api/products',[ProductController::class, 'getproducts'])->name('getProducts');

Route::get('/api/products/{id}',[ProductController::class,'getProductInfo'])->name('getProductInfo');

Route::get('/api/products/category/{id}',[ProductController::class, 'getProductsCategory'])->name('getProductsCategory');

Route::middleware('custom.token')->group(function(){
    Route::get('/api/auth/check',function(){
        return response()->json(['message' => 'You are authenticated']);
    });

    Route::post('/api/auth/logout',[ApiController::class, 'logout'])->name('logout');
});
