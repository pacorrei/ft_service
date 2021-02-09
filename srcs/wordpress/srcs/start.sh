rm -rf /var/cache/
export TELEGRAF_CONFIG_PATH=/etc/telegraf.conf
telegraf & 
php-fpm7 & nginx -g 'daemon off;'