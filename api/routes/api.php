<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Auth\LoginController;
use App\Http\Controllers\Auth\RegisterController;
use App\Http\Controllers\PostsController;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

//login
Route::post('/login',LoginController::class);

//register
Route::post('/register',[RegisterController::class,'store']);

//api
Route::get('post',[PostsController::class, 'index']);
    Route::get('post/edit/{post}',[PostsController::class,'edit']);
    Route::post('post/edit/{post}',[PostsController::class,'update']);
    Route::post('post/create',[PostsController::class,'store']);
    Route::delete('post/delete/{post}',[PostsController::class, 'delete']);

