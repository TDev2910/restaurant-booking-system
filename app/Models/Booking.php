<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Booking extends Model
{
    protected $fillable = [
        'customer_name',
        'email',
        'phone',
        'guest_count',
        'booking_date',
        'status',
        'admin_note'
    ];
}
