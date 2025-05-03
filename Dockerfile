FROM php:8.2-apache
WORKDIR /var/www/html
COPY . .
RUN cp .env.example .env && \
    php artisan key:generate && \
    docker-php-ext-install pdo pdo_mysql && \
    chmod -R 775 storage bootstrap/cache && \
    a2enmod rewrite
