FROM debian:bullseye

RUN apt-get -y update && apt-get -y install nginx 
COPY ./tools/index.html /var/www/html/index.html
COPY ./conf/nginx.conf /etc/nginx/conf.d
RUN apt-get -y update && apt-get install -y openssl
RUN mkdir /etc/nginx/ssl /var/www/wordpress

COPY ./tools/inception.crt /etc/nginx/ssl/
COPY ./tools/inception.key /etc/nginx/ssl/

RUN chmod 777 /etc/nginx/ssl/inception.crt /etc/nginx/ssl/inception.key
RUN chmod 755 /var/www/wordpress  &&  chown -R www-data:www-data /var/www/wordpress
EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
