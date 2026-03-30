<?php

use App\Http\Controllers\Guest\GuestController;
use App\Http\Controllers\ProfileController;
use Illuminate\Foundation\Application;
use Illuminate\Support\Facades\Route;
use Inertia\Inertia;

Route::get('/', [GuestController::class, 'home'])->name('home');
Route::get('/thuc-don', [GuestController::class, 'menu'])->name('guest.menu');
Route::get('/album', [GuestController::class, 'album'])->name('guest.album');
Route::get('/tin-tuc', [GuestController::class, 'news'])->name('guest.news');
Route::get('/lien-he', [GuestController::class, 'contact'])->name('guest.contact');
Route::get('/gioi-thieu', [GuestController::class, 'aboutus'])->name('guest.aboutus');

Route::get('/dashboard', function () {
    return Inertia::render('Dashboard');
})->middleware(['auth', 'verified'])->name('dashboard');

Route::middleware('auth')->group(function () {
    Route::get('/profile', [ProfileController::class, 'edit'])->name('profile.edit');
    Route::patch('/profile', [ProfileController::class, 'update'])->name('profile.update');
    Route::delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');
});

require __DIR__ . '/auth.php';
