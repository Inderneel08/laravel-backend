<?php

use App\Http\Controllers\ApiController;
use App\Http\Controllers\CartController;
use App\Http\Controllers\CategoryController;
use App\Http\Controllers\PaymentController;
use App\Http\Controllers\ProductController;
use App\Models\States;
use Illuminate\Support\Facades\Route;

Route::post('/api/auth/login',[ApiController::class,'login'])->name('login');

Route::post('/api/auth/register',[ApiController::class,'register'])->name('register');

Route::get('/api/products',[ProductController::class, 'getproducts'])->name('getProducts');

Route::get('/api/products/{id}',[ProductController::class,'getProductInfo'])->name('getProductInfo');

Route::get('/api/products/category/{id}',[ProductController::class, 'getProductsCategory'])->name('getProductsCategory');

Route::get('/api/getAll/categories',[CategoryController::class,'getAllCategories'])->name('categories');

Route::get('/welcome',function(){
    return(view('welcome'));
});


Route::get("/api/getStates",function(){

    $states = States::all();

    return(response()->json(['states' => $states]));
});


Route::middleware('custom.token')->group(function(){
    Route::get('/api/auth/check',function(){
        return response()->json(['message' => 'You are authenticated']);
    });

    Route::get("/api/processPendingOrders",[PaymentController::class,'processPendingOrders'])->name('processPendingOrders');

    Route::post('/api/auth/createOrder',[PaymentController::class,'createOrder'])->name('createOrders');

    Route::post('/api/auth/updateProfile',[ApiController::class,'updateProfile'])->name('updateProfile');

    Route::post('/api/auth/updatePassword',[ApiController::class,'updatePassword'])->name('updatePassword');

    Route::get('/api/auth/findProfileInfo',[ApiController::class,'getProfileInfo'])->name('findProfileInfo');

    Route::post('/api/auth/addToCart',[CartController::class,'addToCart'])->name('addToCart');

    Route::get('/api/auth/getCartInfo',[CartController::class,'getCartInfo'])->name('getCartInfo');

    Route::get('/api/auth/getCartItems',[CartController::class,'getCartItems'])->name('getCartItems');

    Route::post('/api/auth/removeFromCart',[CartController::class,'removeFromCart'])->name('removeFromCart');

    Route::post('/api/auth/logout',[ApiController::class, 'logout'])->name('logout');
});
