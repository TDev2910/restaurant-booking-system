<?php

use App\Http\Controllers\Guest\GuestController;
use App\Http\Controllers\ProfileController;
use App\Http\Controllers\BookingController;
use Illuminate\Foundation\Application;
use Illuminate\Support\Facades\Route;
use Inertia\Inertia;

Route::get('/', [GuestController::class, 'home'])->name('home');
Route::get('/thuc-don', [GuestController::class, 'menu'])->name('guest.menu');
Route::get('/album/tiec', [GuestController::class, 'albumParty'])->name('guest.album.tiec');
Route::get('/album/rap', [GuestController::class, 'albumTent'])->name('guest.album.rap');
Route::get('/album', function() { return redirect()->route('guest.album.tiec'); })->name('guest.album');
Route::get('/lien-he', [GuestController::class, 'contact'])->name('guest.contact');
Route::get('/gioi-thieu', [GuestController::class, 'aboutus'])->name('guest.aboutus');

Route::get('/dashboard', function () {
    return Inertia::render('Dashboard');
})->middleware(['auth', 'verified'])->name('dashboard');

Route::middleware('auth')->group(function () {
    Route::get('/profile', [ProfileController::class, 'edit'])->name('profile.edit');
    Route::patch('/profile', [ProfileController::class, 'update'])->name('profile.update');
    Route::delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');

    // Admin Booking Management
    Route::get('/admin/bookings', [BookingController::class, 'index'])->name('admin.bookings.index');
    Route::patch('/admin/bookings/{booking}', [BookingController::class, 'update'])->name('admin.bookings.update');
});

Route::post('/bookings', [BookingController::class, 'store'])->name('bookings.store');

require __DIR__ . '/auth.php';
