FROM debian:bullseye

#ENV MYSQL_ROOT_PASSWORD=1998 
#ENV MYSQL_DATABASE=WORDPRESS

RUN apt-get update -y  && apt-get install  mariadb-server mariadb-client -y
RUN apt-get update -y && apt-get install systemd -y
RUN systemctl enable mysql
#RUN chmod 755 /var/run/mysqld/ 
   # chown mysql:mysql /var/run/mysqld/ \
   #chmod 755 /var/run/mysqld/mysqld.sock \
#	chown mysql:mysql /var/run/mysqld/mysqld.sock \
	
#RUN apt-get install mariadb-server  -y
COPY  ./conf/core.sql ./
COPY  ./conf/db.sh .
RUN chmod +x ./db.sh ./core.sql
#RUN service mariadb  start
#RUN  service mariadb start && mysql -u root <  "./core.sql"
#RUN sed -i 's/127\.0\.0\.1/0.0.0.0/g' /etc/mysql/mariadb.conf.d/50-server.cnf
#RUN service mariadb restart

#EXPOSE 3307
#RUN ./db.sh
CMD ["./db.sh"]

