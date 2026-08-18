FROM php:7.4-cli-alpine3.16
COPY --from=composer:2.10 /usr/bin/composer /usr/bin/composer

RUN apk add --no-cache git zip unzip zlib-dev libpng-dev libzip-dev libxml2-dev

RUN docker-php-ext-install zip \
    && docker-php-ext-install exif \
    && docker-php-ext-install gd \
    && docker-php-ext-install sockets \
    && docker-php-ext-install soap