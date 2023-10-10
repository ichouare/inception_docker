FROM ubuntu

RUN apt-get -y update && apt-get -y install nginx
RUN mkdir /var/www/inception
COPY ./tools/index.html /var/www/inception/
COPY ./conf/inception /etc/nginx/sites-enabled/inception
RUN apt-get -y update && apt-get install -y openssl
RUN mkdir /etc/nginx/ssl

COPY ./tools/inception.crt /etc/nginx/ssl/
COPY ./tools/inception.key /etc/nginx/ssl/

RUN chmod 777 /etc/nginx/ssl/inception.crt /etc/nginx/ssl/inception.key

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
