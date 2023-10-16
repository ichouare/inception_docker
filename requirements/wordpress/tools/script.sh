#!/bin/bash

sleep 15
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
sleep 10
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp


mv /wp-config.php /var/www/wordpress/wp-config.php

sed -i -r "s/define\( 'DB_NAME', '.*' \);/define( 'DB_NAME', 'wp_db' );/" /var/www/wordpress/wp-config.php
sed -i -r "s/define\( 'DB_USER', '.*' \);/define( 'DB_USER', 'ichouare' );/" /var/www/wordpress/wp-config.php
sed -i -r "s/define\( 'DB_PASSWORD', '.*' \);/define( 'DB_PASSWORD', '1998' );/" /var/www/wordpress/wp-config.php
sed -i -r "s/define\( 'HOST', '.*' \);/define( 'HOST', 'mariadb' );/" /var/www/wordpress/wp-config.php

/usr/local/bin/wp core install --url=ichouare.42.fr  --title=inception --admin_user=ichouare --admin_password=1998 --admin_email=issam.chouaref1998@gmail.com --skip-email=  --path='/var/www/wordpress' --allow-root

echo "Base wordpress  config completed"
echo "star wordpress" && /usr/sbin/php-fpm7.4 -F
