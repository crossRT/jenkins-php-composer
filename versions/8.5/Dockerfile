FROM php:8.5-cli-alpine3.24
COPY --from=composer:2.10 /usr/bin/composer /usr/bin/composer

RUN apk add --no-cache git zip unzip zlib-dev libpng-dev libzip-dev linux-headers openssh-client

RUN docker-php-ext-install zip \
    && docker-php-ext-install exif \
    && docker-php-ext-install gd \
    && docker-php-ext-install sockets \
    && docker-php-ext-install pdo_mysql

ENV HOME=/tmp
