<?php

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});

Route::get('/summary', 'summaryController@index')->name('summary');
Route::get('/sale', 'summaryController@salesummary')->name('salesummary');
Route::get('/purchase', 'summaryController@purchasesummary')->name('purchasesummary');
Route::get('/expense', 'summaryController@expensesummary')->name('expensesummary');
Route::get('/cash', 'CashInHandController@index')->name('cash');
Auth::routes();

Route::get('/home', 'HomeController@index')->name('home');
