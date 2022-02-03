<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\CustomAuthController;

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
    return view('auth.login');
});




Route::get('/summary', 'summaryController@index')->name('summary');
Route::get('/sale', 'SalesController@showsales')->name('salesummary');
Route::get('/msale', 'SalesController@mobilesales')->name('mobilesales');
Route::get('/purchase', 'PurchaseController@showpurchase')->name('purchasesummary');
Route::get('/expense', 'ExpenseController@showexpense')->name('expensesummary');
Route::get('/cash', 'CashInHandController@index')->name('cash');

Route::get('dashboard', [CustomAuthController::class, 'dashboard']); 

Route::get('login', [CustomAuthController::class, 'index'])->name('login');

Route::post('custom-login', [CustomAuthController::class, 'customLogin'])->name('login.custom'); 



Route::get('signout', [CustomAuthController::class, 'signOut'])->name('signout');
Auth::routes();

Route::get('/home', 'HomeController@index')->name('home');
