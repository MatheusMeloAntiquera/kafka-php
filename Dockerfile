FROM php:8.0.0rc1-fpm

# Install system dependencies
RUN apt-get update && apt-get install -y git

RUN git clone https://github.com/edenhill/librdkafka.git \
    && cd librdkafka \
    && ./configure \
    && make && make install 

RUN cd / && git clone https://github.com/arnaud-lb/php-rdkafka.git \
    && cd php-rdkafka \
    && phpize \
    && ./configure \
    && make all -j 5 \ 
    && make install

# Install PHP extensions
RUN docker-php-ext-install pdo_mysql

# Get latest Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Set working directory
WORKDIR /var/www