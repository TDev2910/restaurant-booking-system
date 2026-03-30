# ============================================================
# Stage 1: PHP + Composer dependencies
# ============================================================
FROM composer:2.8 AS vendor

WORKDIR /app

# Copy only the files needed for composer install first
# — this layer is cached independently of application code
COPY composer.json composer.lock ./

# Install production deps only, no scripts, no interaction
RUN composer install \
    --no-dev \
    --no-scripts \
    --no-interaction \
    --prefer-dist \
    --optimize-autoloader

# ============================================================
# Stage 2: Node / Vite – build frontend assets
# ============================================================
FROM node:22-alpine AS frontend

WORKDIR /app

# Copy package files first — cached separately from source code
COPY package.json package-lock.json ./
RUN npm ci --ignore-scripts

# Copy full source (needed by vite to resolve paths like resources/, etc.)
COPY . .
# Bring vendor from stage 1 so Ziggy / vendor JS links resolve correctly
COPY --from=vendor /app/vendor ./vendor

RUN npm run build

# ============================================================
# Stage 3: Final production image
# ============================================================
FROM php:8.2-fpm-alpine AS production

# Labels (OCI standard)
LABEL org.opencontainers.image.title="XuanDieuChef API"
LABEL org.opencontainers.image.description="Laravel 12 production image"

# ── System dependencies 
# Group into one RUN to minimise layers; clean up cache in same step
RUN apk add --no-cache \
    nginx \
    supervisor \
    curl \
    libpng-dev \
    libjpeg-turbo-dev \
    libwebp-dev \
    freetype-dev \
    oniguruma-dev \
    libzip-dev \
    icu-dev \
    && mkdir -p /var/log/supervisor \
    && docker-php-ext-configure gd \
        --with-freetype \
        --with-jpeg \
        --with-webp \
    && docker-php-ext-install -j$(nproc) \
        pdo_mysql \
        mbstring \
        zip \
        exif \
        pcntl \
        bcmath \
        gd \
        opcache \
        intl

# ── PHP configuration 
COPY docker/php/php.ini /usr/local/etc/php/conf.d/app.ini
COPY docker/php/opcache.ini /usr/local/etc/php/conf.d/opcache.ini

# ── Nginx configuration 
COPY docker/nginx/nginx.conf /etc/nginx/nginx.conf
COPY docker/nginx/default.conf /etc/nginx/http.d/default.conf

# ── Supervisor configuration 
COPY docker/supervisor/supervisord.conf /etc/supervisor/conf.d/supervisord.conf

WORKDIR /var/www/html

# ── Application code 
# Copy app code from the build context (no dev files thanks to .dockerignore)
COPY --chown=www-data:www-data . .

# Bring in Composer vendor (prod only) from stage 1
COPY --chown=www-data:www-data --from=vendor /app/vendor ./vendor

# Bring in compiled frontend assets from stage 2
COPY --chown=www-data:www-data --from=frontend /app/public/build ./public/build

# ── Permissions
RUN mkdir -p storage/logs \
    storage/framework/{cache,sessions,views} \
    bootstrap/cache \
    && chown -R www-data:www-data storage bootstrap/cache \
    && chmod -R 775 storage bootstrap/cache

# ── Non-root user 
USER www-data

# ── Runtime 
EXPOSE 80

# Entrypoint: run Laravel bootstrap commands then start supervisor
COPY --chown=www-data:www-data docker/entrypoint.sh /entrypoint.sh
USER root
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]
