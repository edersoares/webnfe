FROM php:fpm

MAINTAINER Eder Soares

RUN apt-get update
RUN apt-get upgrade -y

RUN apt-get install -y libfreetype6-dev libjpeg62-turbo-dev libpng12-dev
RUN docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/
RUN docker-php-ext-install gd

RUN apt-get install -y libxml2-dev
RUN docker-php-ext-install soap

RUN docker-php-ext-install zip
