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
sed -i -r "s/define\( 'WP_CACHE_KEY_SALT', 'example.com' \);/define( 'WP_CACHE_KEY_SALT', 'ichouare.42.fr' );/" /var/www/wordpress/wp-config.php
/usr/local/bin/wp core install --url=ichouare.42.fr  --title=inception --admin_user=ichouare --admin_password=1998 --admin_email=issam.chouaref1998@gmail.com --skip-email=  --path='/var/www/wordpress' --allow-root
wget https://assets.digitalocean.com/articles/wordpress_redis/object-cache.php
mv object-cache.php /var/www/wordpress/wp-content/
/usr/local/bin/wp  plugin install redis-cache --activate  --path='/var/www/wordpress'  --allow-root
/usr/local/bin/wp redis update-dropin --path='var/www/wordpress' --allow-root
#/usr/local/bin/wp redis enable --host=redis --port=6379 --path="/var/www/wordpress" --allow-root
#/usr/local/bin/wp plugin activate redis-cache --allow-root
echo "PHP script for WordPress"
#wget https://assets.digitalocean.com/articles/wordpress_redis/object-cache.php
sleep 10
#mv object-cache.php /var/www/wordpress/wp-content/



echo "Base wordpress  config completed"
echo "star wordpress" && /usr/sbin/php-fpm7.4 -F
