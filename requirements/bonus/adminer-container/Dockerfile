FROM debian:bullseye

RUN apt update && apt install  wget  php php-mysql  -y 
#RUN a2enconf php*-fpm  &&  a2enconf adminer
WORKDIR /var/www/html
RUN wget "https://www.adminer.org/latest.php" -O index.php
#COPY ./adminer.css /var/www/html
#RUN systemctl reload apache2 
Expose 8080
CMD ["php", "-S", "0.0.0.0:8080", "-t", "/var/www/html"]
