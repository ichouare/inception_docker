#!/bin/bash

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
sleep 15
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp


#mv /wp-config.php /var/www/wordpress/wp-config.php
if [ ! -f "/var/www/wordpress/wp-config.php" ]; then
    ./wp-cli.phar core download --path="/var/www/wordpress" --allow-root
    sleep 5
  ./wp-cli.phar  config create --allow-root \	
	--dbname=WORDPRESSDB\
	--dbuser=ichouare\								--dbpass=1998 \
	--dbhost=mariadb:3306 --path='/var/www/wordpress'
 
fi
sleep 5
sed -i 's/listen = \/run\/php\/php7.4-fpm.sock/listen = 0.0.0.0:9000/g' /etc/php/7.4/fpm/pool.d/www.conf
mkdir run/php
echo "creat run/php floder"
echo "star wordpress" && /usr/sbin/php-fpm7.4 -F
