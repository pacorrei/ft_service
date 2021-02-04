#!/bin/sh
export TELEGRAF_CONFIG_PATH=/etc/telegraf.conf

rm -f /var/cache/apk/*

#create admin user for nginx
echo -e "passwd\npasswd" | adduser admin

#create necessary directories
mkdir -p /run/nginx /etc/ssl/certs /etc/ssl/private

#move landing page
cp /var/lib/nginx/html/index.html /var/www/index.html

#create ssl credentials
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/certs/nginx.key -out /etc/ssl/certs/nginx.crt -subj "/CN=$MIP"
openssl dhparam -dsaparam -out /etc/ssl/certs/dhparam.pem 2048

#start services
telegraf &
/usr/sbin/nginx -g 'daemon off;'
