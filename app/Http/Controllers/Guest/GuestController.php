<?php

namespace App\Http\Controllers\Guest;

use App\Http\Controllers\Controller;
use Inertia\Inertia;

class GuestController extends Controller
{
    public function home()
    {
        return Inertia::render('Guest/Home');
    }

    public function menu()
    {
        return Inertia::render('Guest/Menu');
    }

    public function albumFood()
    {
        return Inertia::render('Guest/Album/FoodAlbum');
    }

    public function albumParty()
    {
        return Inertia::render('Guest/Album/PartyAlbum');
    }

    public function albumTent()
    {
        return Inertia::render('Guest/Album/TentAlbum');
    }

    public function contact()
    {
        return Inertia::render('Guest/Contact');
    }

    public function aboutus()
    {
        return Inertia::render('Guest/Aboutus');
    }
}
