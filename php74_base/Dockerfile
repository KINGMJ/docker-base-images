FROM php:7.4-fpm

# 设置时区
RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
RUN echo "Asia/Shanghai" > /etc/timezone

# 设置字符编码
ENV LANG C.UTF-8

# 新增 ll 命令
RUN echo 'alias ll="ls -l -a"' >> ~/.bashrc

# 安装lib库
RUN apt-get clean \
    && apt-get update --fix-missing \
    && apt-get install -y vim net-tools zip git \
        zlib1g-dev libzip-dev libevent-dev \
        libfreetype6-dev libjpeg62-turbo-dev libpng-dev libgmp-dev

# 安装 php gd 扩展
RUN docker-php-ext-install gd

# 安装 calendar 扩展
RUN docker-php-ext-install calendar

# 安装 zip
RUN docker-php-ext-install zip

# mysql pdo 等扩展
RUN docker-php-ext-install mysqli pdo pdo_mysql

# php-imagick 扩展
RUN apt-get install -y \
    libmagickwand-dev --no-install-recommends \
    && pecl install imagick \
	&& docker-php-ext-enable imagick

# 安装 bcmath 扩展
RUN docker-php-ext-install bcmath

# 安装gmp扩展
RUN docker-php-ext-install gmp

# 安装 composer
RUN php -r "copy('https://install.phpcomposer.com/installer', 'composer-setup.php');"
RUN php composer-setup.php
RUN php -r "unlink('composer-setup.php');"

# 可以直接使用 composer 命令
RUN mv composer.phar /usr/local/bin/ \
    && ln -s /usr/local/bin/composer.phar /usr/local/bin/composer
