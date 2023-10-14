#!/bin/bash

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
sleep 10
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp


mv /wp-config.php /var/www/wordpress/wp-config.php

sed -i -r "s/define\( 'DB_NAME', '.*' \);/define( 'DB_NAME', 'WORDPRESSDB' );/" /var/www/wordpress/wp-config.php
sed -i -r "s/define\( 'DB_USER', '.*' \);/define( 'DB_USER', 'ichouare' );/" /var/www/wordpress/wp-config.php
sed -i -r "s/define\( 'DB_PASSWORD', '.*' \);/define( 'DB_PASSWORD', '1998' );/" /var/www/wordpress/wp-config.php
sed -i -r "s/define\( 'HOST', '.*' \);/define( 'HOST', 'mariadb:3306' );/" /var/www/wordpress/wp-config.php
chown -R www-data:www-data /var/www/wordpress/wp-config.php
sleep 10
sed -i 's/listen = \/run\/php\/php7.4-fpm.sock/listen = 0.0.0.0: 9000/g' /etc/php/7.4/fpm/pool.d/www.conf
service php7.4-fpm start
echo "creat run/php floder"
echo "star wordpress" && /usr/sbin/php-fpm7.4 -F
