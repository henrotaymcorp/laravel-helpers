FROM php:8.2-cli-alpine AS cli

COPY --from=composer:2.5.8 /usr/bin/composer /usr/bin/composer

WORKDIR /opt/apps/app

COPY composer.json ./

RUN composer update --no-scripts --no-autoloader --prefer-dist

COPY . .

RUN composer update --prefer-dist
