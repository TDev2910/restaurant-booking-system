#!/usr/bin/env bash
# Exit on error
set -o errexit

echo "--- BẮT ĐẦU QUY TRÌNH BUILD ---"

# 1. Cài đặt PHP dependencies (Composer)
# Render đã có sẵn PHP và Composer
composer install --no-dev --optimize-autoloader

# 2. Cài đặt Node dependencies và Build Frontend (Vue/Inertia)
npm install
npm run build

# 3. Tối ưu hóa Laravel
php artisan config:cache
php artisan route:cache
php artisan view:cache

echo "--- BUILD HOÀN TẤT ---"
