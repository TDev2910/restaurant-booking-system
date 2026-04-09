#!/bin/sh
set -e

echo "→ [1/6] Setting permissions..."
mkdir -p storage/logs \
         storage/framework/cache \
         storage/framework/sessions \
         storage/framework/views \
         bootstrap/cache
chmod -R 775 storage bootstrap/cache

echo "→ [2/6] Creating SQLite database if not exists..."
if [ ! -f database/database.sqlite ]; then
    touch database/database.sqlite
fi

echo "→ [3/6] Clearing stale caches..."
php artisan config:clear  2>/dev/null || true
php artisan route:clear   2>/dev/null || true
php artisan view:clear    2>/dev/null || true

echo "→ [4/6] Linking storage..."
php artisan storage:link --force 2>/dev/null || true

echo "→ [5/6] Running migrations..."
php artisan migrate --force

echo "→ [6/6] Warming up caches..."
php artisan config:cache
php artisan route:cache

echo "→ [7/7] Fixing file ownership and permissions..."
# Sửa quyền cho tất cả file được tạo ra bởi root (trong quá trình install/migrate)
# Sang quyền của user chạy website (www-data)
chown -R www-data:www-data /var/www/html/storage /var/www/html/bootstrap/cache /var/www/html/database
chmod -R 775 /var/www/html/storage /var/www/html/bootstrap/cache /var/www/html/database
if [ -f /var/www/html/database/database.sqlite ]; then
    chmod 664 /var/www/html/database/database.sqlite
fi

echo "→ Application ready. Starting services..."
exec "$@"
