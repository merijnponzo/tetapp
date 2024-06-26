<?php

use App\Http\Controllers\ProfileController;
use App\Http\Controllers\SiteController;
use App\Http\Controllers\DashboardController;
use App\Http\Controllers\BrowseController;
use App\Models\Category;
use Illuminate\Foundation\Application;
use Illuminate\Support\Facades\Route;
use Inertia\Inertia;

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

Route::get('/', [BrowseController::class, 'landing'])->name('browse.landing');



Route::prefix('browse')->middleware(['auth', 'verified'])->group(function () {
    Route::get('/', [BrowseController::class, 'index'])->name('browse.index');
    Route::get('/category/{category_id}', [BrowseController::class, 'category'])->name('browse.category');
    Route::get('/cards/{category_id}', [BrowseController::class, 'category_cards'])->name('browse.cards');
    Route::get('/form-card/{category_id}/{card_id}', [BrowseController::class, 'form_card'])->name('browse.form.card');
    Route::post('/form-card/{category_id}/{card_id}', [BrowseController::class, 'create_card'])->name('browse.form.card-create');
    Route::get('/form-subcards/{category_id}/{card_id}', [BrowseController::class, 'form_subcards'])->name('browse.form.subcards');
    Route::post('/form-subcards', [BrowseController::class, 'create_subcards'])->name('browse.form.subcards-create');
    Route::delete('/form-card/{category_id}/{card_id}', [BrowseController::class, 'delete_card'])->name('browse.form.card-delete');
    Route::post('/form-category/visibility', [BrowseController::class, 'toggle_category_visibility'])->name('browse.form.category-visibility');
    Route::get('/form-category/category/{category_id}/{mode}', [BrowseController::class, 'form_category'])->name('browse.form.category');
    Route::post('/form-category/{category_id}/{mode}', [BrowseController::class, 'create_category'])->name('browse.form.category-create');
});



Route::prefix('dashboard')->middleware(['auth', 'verified'])->group(function () {
    Route::get('/', [DashboardController::class, 'index'])->name('dashboard');
});


Route::middleware('auth')->group(function () {
    Route::get('/profile', [ProfileController::class, 'edit'])->name('profile.edit');
    Route::patch('/profile', [ProfileController::class, 'update'])->name('profile.update');
    Route::delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');
});


Route::prefix('site')->middleware(['auth', 'verified'])->group(function () {
    Route::get('/', [SiteController::class, 'index'])->name('site.index');
    Route::post('/', [SiteController::class, 'create'])->name('site.create');
});





use Illuminate\Database\Connection;


require __DIR__ . '/auth.php';
