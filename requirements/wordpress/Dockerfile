
FROM debian:bullseye


RUN apt-get update -y && apt-get upgrade -y
RUN  apt-get install  wget -y \
	php7.4 \
	php-fpm \
	php-cli \
	php-mysql \
	php-curl \
	php-gd \
	php-intl \
	php-fpm \
	php-mysql \
	curl \
	mariadb-client -y
RUN service php7.4-fpm start && mkdir -p /var/www
WORKDIR /var/www

RUN curl -LO https://wordpress.org/latest.tar.gz
RUN tar xzvf latest.tar.gz && chown -R root:root /var/www/wordpress
RUN  adduser ichouare 
RUN chown -R ichouare:www-data /var/www/wordpress &&  chmod -R o-rwx /var/www/wordpress 
#COPY ./conf/www.conf  /etc/php/7.4/fpm/pool.d/www.conf
RUN sed -i 's/listen = \/run\/php\/php7.4-fpm.sock/listen = 9000/g' /etc/php/7.4/fpm/pool.d/www.conf
RUN mkdir -p /run/php
RUN cp /var/www/wordpress/wp-config-sample.php  /var/www/wordpress/wp-config.php
COPY ./conf/wp-config.php /var/www/wordpress/wp-config.php
EXPOSE 9000:9000
CMD ["php-fpm7.4", "-F", "-R"]

