# Composer image
FROM composer:1.9 AS composer

# PHP image
FROM php:7.4-fpm-alpine
RUN apk add zlib-dev libpng-dev libzip-dev supervisor
# Install php extensions
RUN docker-php-ext-install pdo pdo_mysql gd zip

# Copy the composer file to the php image
COPY --from=composer /usr/bin/composer /usr/bin/composer

# Set the default working folder
WORKDIR /var/www