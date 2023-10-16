FROM debian:bullseye

RUN apt-get -y update && apt-get -y install nginx 
COPY ./tools/index.html /var/www/wordpress/
COPY ./tools/phpinfo.php /var/www/wordpress/
#COPY ./conf/nginx.conf /etc/nginx/sites-enabled/nginx.conf
COPY ./conf/nginx.conf /etc/nginx/conf.d
RUN apt-get -y update && apt-get install -y openssl
RUN mkdir /etc/nginx/ssl

COPY ./tools/inception.crt /etc/nginx/ssl/
COPY ./tools/inception.key /etc/nginx/ssl/

RUN chmod 777 /etc/nginx/ssl/inception.crt /etc/nginx/ssl/inception.key
RUN chmod 755 /var/www/wordpress  &&  chown -R www-data:www-data /var/www/wordpress
#RUN  ln -s /etc/nginx/sites-available/nginx.conf /etc/nginx/sites-enabled/ \ 
	#&& unlink /etc/nginx/sites-enabled/default
#RUN sed -i 's/listen = \/run\/php\/php7.4-fpm.sock/listen = 0.0.0.0:443/g' /etc/php/7.4/fpm/pool.d/www.conf
EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
