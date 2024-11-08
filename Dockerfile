FROM php:8.2-fpm-alpine

RUN apk --update --no-cache --virtual .build-deps add  $PHPIZE_DEPS \
    && apk --update --no-cache add \
    icu-dev \
    libzip-dev \
    zip \
    unzip \
    libpng \
    libpng-dev \
    libjpeg-turbo \
    libjpeg-turbo-dev \
    freetype \
    freetype-dev \
    oniguruma-dev \
    pcre-dev \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-configure intl \
    && docker-php-ext-install mbstring exif pcntl bcmath gd zip intl \
    && apk del .build-deps

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer