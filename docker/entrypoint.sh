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

echo "→ Application ready. Starting services..."
exec "$@"
