<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Models\Booking;
use Illuminate\Support\Carbon;
use Inertia\Inertia;

class BookingController extends Controller
{
    /**
     * Display a listing of the bookings for admin.
     */
    public function index()
    {
        $bookings = Booking::orderBy('booking_date', 'desc')->get();
        return Inertia::render('Admin/Bookings', [
            'bookings' => $bookings
        ]);
    }

    /**
     * Store a newly created booking in storage.
     */
    public function store(Request $request)
    {
        $request->validate([
            'customer_name' => 'required|string|max:255',
            'email' => 'nullable|email|max:255',
            'phone' => 'required|string|max:20',
            'guest_count' => 'required|integer|min:1',
            'booking_date' => 'required', // KHÔNG dùng |date vì ISO string sẽ bị lỗi
        ]);

        // Lấy trực tiếp từ $request (không qua $validated) để tránh Laravel can thiệp
        Booking::create([
            'customer_name' => $request->customer_name,
            'email'         => $request->email,
            'phone'         => $request->phone,
            'guest_count'   => $request->guest_count,
            'booking_date'  => Carbon::parse($request->booking_date)->format('Y-m-d H:i:s'),
        ]);

        return redirect()->back()->with('success', 'Đã lưu thông tin đặt bàn của bạn. Chúng tôi sẽ liên hệ sớm!');
    }

    /**
     * Update the specified booking in storage for admin.
     */
    public function update(Request $request, Booking $booking)
    {
        $validated = $request->validate([
            'status' => 'required|in:pending,confirmed,cancelled',
            'admin_note' => 'nullable|string',
        ]);

        $booking->update($validated);

        return redirect()->back()->with('success', 'Cập nhật trạng thái thành công!');
    }
}
