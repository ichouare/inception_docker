FROM debian:bullseye

#ENV MYSQL_ROOT_PASSWORD=1998 
#ENV MYSQL_DATABASE=WORDPRESS

RUN apt-get update -y && apt-get upgrade -y
RUN apt-get update -y && apt-get install systemd -y

RUN apt-get install mariadb-server mariadb-client -y
COPY  ./conf/core.sql ./
#COPY  ./conf/db.sh .
#RUN chmod 777 ./db.sh
RUN  service  mysql  start  && mysql -u root <  "./core.sql"

EXPOSE 3306

CMD [ "mysqld"]

