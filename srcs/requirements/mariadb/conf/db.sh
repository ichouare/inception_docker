#!/bin/bash

service mariadb  start
echo "hello from mariadb"
echo "CREATE DATABASE IF NOT EXISTS  ${db_name};" > ./core.sql
echo "CREATE USER IF NOT EXISTS  '${db_user}'@'%' IDENTIFIED BY '${db_pwd}';" >> ./core.sql
#echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '${db_pwd}'; " >> ./core.sql
echo "CREATE USER IF NOT EXISTS '${db1_user}'@'%' IDENTIFIED BY '${db1_pwd}';" >> ./core.sql
echo "GRANT ALL PRIVILEGES ON ${db_name}.* TO '${db_user}'@'%';" >> ./core.sql
echo "FLUSH PRIVILEGES;" >> ./core.sql
echo "ALTER USER 'root'@'%' IDENTIFIED BY '${db_pwd}';" >> ./core.sql
mariadb -u root -p "${db_pwd}" <  ./core.sql
# replace occurrences of 127.0.0.1 with 0.0.0.0 in the file 
sed -i 's/127\.0\.0\.1/0.0.0.0/g' /etc/mysql/mariadb.conf.d/50-server.cnf
#kill $(cat /var/run/mysqld/mysqld.pid)
mysqladmin -u root -p"${db_pwd}" shutdown 
echo "mariadb start"
#service mysql restart
#mysqladmin -u root   shutdown
#start the Mysql server daemon
mysqld
