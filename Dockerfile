FROM php:7.2-cli-alpine3.12
COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

RUN apk add --no-cache git zip unzip zlib-dev libpng-dev

RUN docker-php-ext-install zip \
    && docker-php-ext-install exif \
    && docker-php-ext-install gd \
    && docker-php-ext-install sockets
