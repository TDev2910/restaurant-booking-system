# Hướng dẫn chi tiết Cấu hình Docker (Production-Ready)

Tài liệu này giải thích chi tiết vai trò và các tinh chỉnh tối ưu cho dự án Laravel 12 + Inertia/Vue của bạn.

---

## 🏗️ 1. Dockerfile (Chiến lược Multi-stage)
File này sử dụng 3 giai đoạn (stages) để đảm bảo Image cuối cùng nhẹ nhất và bảo mật nhất.

*   **Stage 1 (`vendor`):** Sử dụng `composer` để cài đặt các thư viện PHP. Chỉ cài đặt các thư viện `production` (`--no-dev`) và tối ưu hóa bộ nạp lớp (`--optimize-autoloader`).
*   **Stage 2 (`frontend`):** Sử dụng `node` để chạy `npm run build`. Sau khi hoàn tất, chỉ các file đã biên dịch trong `public/build` được giữ lại.
*   **Stage 3 (`production`):** Sản phẩm cuối dùng `php-fpm-alpine`.
    *   **Bảo mật:** Chạy dưới user `www-data` (hạn chế quyền truy cập hệ thống).
    *   **Tối ưu:** Cài đặt các extension PHP thiết yếu (`pdo_mysql`, `gd`, `opcache`, `intl`).

---

## 📁 2. Thư mục `docker/` (Cấu hình chi tiết)

### 🔹 `entrypoint.sh`
Là file tập lệnh chạy đầu tiên khi Container khởi động. 
*   **Nhiệm vụ:** Tự động hóa việc dọn dẹp cache, chạy `migrate` cập nhật Database và tạo `storage:link`. 
*   **Lợi ích:** Đảm bảo môi trường luôn được đồng bộ mỗi khi deploy phiên bản mới.

### 🔹 `nginx/`
*   **`nginx.conf`:** Cấu hình lõi của máy chủ web. Ẩn thông tin phiên bản để bảo mật và bật nén Gzip để tăng tốc độ truyền tải dữ liệu.
*   **`default.conf`:** Cấu hình trang web cụ thể. 
    *   Đã tối ưu để phục vụ các file tĩnh (ảnh, js, css) với bộ nhớ đệm (Cache-Control) cực dài. 
    *   Phân phối yêu cầu đến PHP-FPM một cách an toàn.

### 🔹 `php/`
*   **`php.ini`:** Cấu hình múi giờ (Vietnam), giới hạn bộ nhớ (256MB) và kích thước tệp tải lên (64MB) phù hợp cho việc đăng bài viết ẩm thực có ảnh chất lượng cao.
*   **`opcache.ini`:** Cấu hình "bình tăng lực" cho PHP. Lưu trữ mã code đã biên dịch vào RAM để giảm tải cho CPU và tăng tốc độ xử lý yêu cầu.

### 🔹 `supervisor/`
*   **`supervisord.conf`:** Bộ quản lý tiến trình. 
*   **Vai trò:** Cho phép chạy đồng thời cả Nginx (Web), PHP-FPM (Code) và Laravel Queue (Email/Thông báo) trong cùng một Container mà không cái nào bị "chết" giữa chừng.

---

## 📦 3. docker-compose.prod.yml
Dùng để triển khai thực tế trên server (VPS).
*   **Healthcheck:** App chỉ khởi động khi Database đã sẵn sàng.
*   **Volumes:** Đảm bảo dữ liệu (Database và Ảnh khách hàng tải lên) không bị mất khi bạn update app.
*   **Network:** Database được giấu kín trong mạng nội bộ Docker, không lộ port ra ngoài Internet.

---

## 🔒 4. .dockerignore
Ngăn chặn các file rác và nhạy cảm (như `.env`, `.git`) bị đóng gói vào Image. Giảm dung lượng build và tăng tính bảo mật.

---

## 🚀 Cách chạy Production
Từ thư mục gốc của dự án, gõ lệnh:
```bash
docker compose -f docker-compose.prod.yml up -d --build
```
Hệ thống sẽ tự động làm toàn bộ phần còn lại!
