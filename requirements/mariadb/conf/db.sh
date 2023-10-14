#!/bin/bash
service mariadb start;
mysql -u root <  "./core.sql"
sed -i 's/127\.0\.0\.1/0.0.0.0/g' /etc/mysql/mariadb.conf.d/50-server.cnf
service mariadb restart
mysql
