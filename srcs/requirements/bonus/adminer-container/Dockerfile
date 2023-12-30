FROM debian:bullseye

RUN apt update && apt install  wget  php php-mysql  -y 

WORKDIR /var/www/html
RUN wget "https://www.adminer.org/latest.php" -O index.php

Expose 8080
CMD ["php", "-S", "0.0.0.0:8080", "-t", "/var/www/html"]
