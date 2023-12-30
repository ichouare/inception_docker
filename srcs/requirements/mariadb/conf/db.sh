#!/bin/bash

service mariadb start
echo "hello from mariadb"
sleep 10
echo "CREATE DATABASE IF NOT EXISTS  ${db_name};" > ./core.sql
echo "CREATE USER '${db_user}'@'%' IDENTIFIED BY '${db_pwd}';" >> ./core.sql
echo "CREATE USER '${db1_user}'@'%' IDENTIFIED BY '${db1_pwd}';" >> ./core.sql
echo "GRANT ALL PRIVILEGES ON $db_name.* TO '$db_user'@'%';" >> ./core.sql
echo "FLUSH PRIVILEGES" >> ./core.sql
mysql -u root <  "./core.sql"
sed -i 's/127\.0\.0\.1/0.0.0.0/g' /etc/mysql/mariadb.conf.d/50-server.cnf
echo "mariadb start"
mysqladmin -u root   shutdown
mysqld

