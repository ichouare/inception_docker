
FROM debian:bullseye


RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install  wget -y
RUN apt-get install -y php7.3\
	php-fpm\
	php-mysql\
	mariadb-client\
RUN mkdir -p/var/www
WORKDIR /var/www

RUN wget https://wordpress.org/latest.tar.gz &&& tar xzvf latest.tar.gz
RUN chown -R root:root /var/www/wordpress

CMD ["echo", "hello word !"]
