FROM debian:bullseye

RUN apt-get update -y  && apt-get install  mariadb-server  -y
#RUN apt-get update -y && apt-get install systemd -y
RUN service mariadb start
COPY  ./conf/core.sql ./
COPY  ./conf/db.sh .
RUN chmod +x ./db.sh ./core.sql
CMD ["./db.sh"]

