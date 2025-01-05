FROM php:8.3-cli-alpine3.19
COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

RUN apk add --no-cache git zip unzip zlib-dev libpng-dev libzip-dev linux-headers

RUN docker-php-ext-install zip \
    && docker-php-ext-install exif \
    && docker-php-ext-install gd \
    && docker-php-ext-install sockets
