#!/bin/bash

service mariadb start
echo "hello from mariadb"
sleep 10
#service mariadb start
mysql -u root <  "./core.sql"
sed -i 's/127\.0\.0\.1/0.0.0.0/g' /etc/mysql/mariadb.conf.d/50-server.cnf
echo "mariadb start"
mysqladmin -u root   shutdown
mysqld

