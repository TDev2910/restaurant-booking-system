# Tài liệu Chi tiết Dự án: Landing Page Ẩm thực & Hệ thống Đặt tiệc

## 1. Tổng quan
Dự án xây dựng một trang Landing Page chuyên nghiệp cho dịch vụ ẩm thực, tích hợp hệ thống đặt tiệc trực tuyến. Hệ thống có 1 Admin duy nhất để quản lý nội dung và lịch hẹn.

## 2. Công nghệ sử dụng
- **Backend:** Laravel 12.x
- **Frontend:** Inertia.js + Vue.js 3 + Tailwind CSS 4.x
- **Xác thực:** Laravel Breeze (Bản Inertia)
- **Cơ sở dữ liệu:** MySQL
- **Môi trường:** Docker (Laravel Sail)

## 3. Chức năng chính

### A. Dành cho Khách (Không cần đăng nhập)
- **Trang chủ:** Giao diện bắt mắt giới thiệu không gian và món ăn thực tế (Hero, Menu, News).
- **Đặt tiệc:** Nút "Đặt tiệc" mở Modal để nhập thông tin khách hàng (Tên, SĐT, Email, Ngày, Số người).

### B. Dành cho Admin (Chỉ 1 người)
- **Dashboard:** Thống kê nhanh tình trạng đặt tiệc.
- **Quản lý Đặt tiệc:** Xem danh sách, xác nhận hoặc hủy lịch hẹn của khách.
- **Quản lý Bài viết:** Đăng tin tức, giới thiệu các món ăn mới (CRUD).

## 4. Cấu trúc Cơ sở dữ liệu
- **users:** `id`, `name`, `email`, `password`, `is_admin`.
- **posts:** `id`, `title`, `slug`, `content`, `image`, `is_published`, `created_at`.
- **bookings:** `id`, `customer_name`, `phone`, `email`, `booking_date`, `guests`, `note`, `status` (pending, confirmed, cancelled).

## 5. Lộ trình 1 Tuần (7 Ngày)
- **Ngày 1:** Khởi tạo môi trường Docker Sail và cài đặt Laravel Breeze.
- **Ngày 2-3:** Thiết kế giao diện Landing Page và Modal gửi thông tin đặt tiệc.
- **Ngày 4-5:** Xây dựng Dashboard cho Admin và tính năng Quản lý đặt tiệc/bài viết.
- **Ngày 6:** Kiểm tra toàn bộ luồng dữ liệu (End-to-end Testing).
- **Ngày 7:** Đóng gói Docker cho Production và Deploy lên VPS.

## 6. Chiến lược Triển khai
- Sử dụng **Docker Compose** trên VPS Ubuntu.
- Cấu hình SSL miễn phí qua **Nginx Proxy Manager**.
- CI/CD bằng **GitHub Actions**.
