#!/bin/bash

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
sleep 15
chmod +x wp-cli.phar
#mv wp-cli.phar /usr/local/bin/wp

if [ ! -f "/var/www/html/wp-config.php" ]; then
    ./wp-cli.phar core download --path="/var/www/html" --allow-root
    sleep 5
  ./wp-cli.phar config create --dbname=$DB_NAME --dbuser=$DB_USER --dbpass=$DB_PASS --dbhost=$DB_HOST  --path="/var/www/html" --allow-root
    ./wp-cli.phar core install --url=$DOMAIN_NAME/ --title=mfagri --admin_user=$DB_USER --admin_password=$DB_PASS --admin_email=$ADIMIN_EMAIL --skip-email  --path="/var/www/html" --allow-root
    ./wp-cli.phar user create $WP_USER $USER_EMAIL --role=author --user_pass=$WP_PASS  --path="/var/www/html" --allow-root
    ./wp-cli.phar theme install astra --activate  --path="/var/www/html" --allow-root
    # wp config list --path="/var/www/html" --allow-root
    #bonus redis
    #wp config set WP_CACHE_KEY_SALT 'localhost'  --path="/var/www/html" --allow-root
    #wp config set WP_REDIS_HOST 'redis'  --path="/var/www/html" --allow-root
    #wp config set WP_REDIS_PORT '6379'  --path="/var/www/html" --allow-root
    #wp config set WP_REDIS_SCHEME 'tcp'  --path="/var/www/html" --allow-root
    #wp config set WP_REDIS_TIMEOUT 60 --path="/var/www/html" --allow-root
    #wp config set WP_CACHE true --path="/var/www/html" --allow-root
    #install pluging and activate it and enable redis
    #wp plugin install redis-cache --activate --path="/var/www/html" --allow-root
   # wp redis enable --host=redis --port=6379 --path="/var/www/html" --allow-root
    # # Set appropriate file permissions for redis
    # find /var/www/html/ -type d -exec chmod 755 {} \;
    chown -R www-data:www-data /var/www/html/
    #example for pluging
    # wp plugin install woocommerce --activate --path="/var/www/html" --allow-root
fi
sleep 5
sed -i 's/listen = \/run\/php\/php7.3-fpm.sock/listen = 9000/g' /etc/php/7.3/fpm/pool.d/www.conf
mkdir run/php
echo "creat run/php floder"
echo "star wordpress" && /usr/sbin/php-fpm7.3 -F
