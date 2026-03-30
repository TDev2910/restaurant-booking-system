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

    public function album()
    {
        return Inertia::render('Guest/Album');
    }

    public function news()
    {
        return Inertia::render('Guest/News');
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
