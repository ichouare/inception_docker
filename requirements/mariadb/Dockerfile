FROM debian:bullseye

#ENV MYSQL_ROOT_PASSWORD=1998 
#ENV MYSQL_DATABASE=WORDPRESS

RUN apt-get update -y && apt-get upgrade -y
RUN apt-get update -y && apt-get install systemd -y

RUN apt-get install mariadb-server  -y
COPY  ./conf/core.sql ./
#COPY  ./conf/db.sh .
#RUN chmod 777 ./db.sh
RUN  service  mariadb  start && sleep 10  && mysql -u root <  "./core.sql"
RUN sed -i 's/127\.0\.0\.1/0.0.0.0/g' /etc/mysql/mariadb.conf.d/50-server.cnf
#RUN service mariadb restart

EXPOSE 3306

CMD [ "mysqld"]

