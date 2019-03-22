FROM php:7.1.8-apache

COPY . /var/www
COPY ./vhosts.conf /etc/apache2/sites-available/000-default.conf

WORKDIR /var/www

ENV TERM xterm

RUN docker-php-ext-install mbstring pdo pdo_mysql \
    && chown -R www-data:www-data /var/www \
    && a2enmod rewrite

RUN apt-get update -y && apt-get install -y openssl zip unzip git\
&& docker-php-ext-install -j$(nproc) tokenizer bcmath ctype
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer