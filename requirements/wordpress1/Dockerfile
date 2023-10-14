FROM debian:buster

RUN apt-get update && \
    apt install -y php php-fpm && apt-get install -y curl &&  apt-get install -y mariadb-server && apt-get install -y php-mysql \
    redis \
	php-redis

COPY ./tools/script.sh /
RUN chmod +x script.sh
EXPOSE 9000
ENTRYPOINT [ "./script.sh" ]
