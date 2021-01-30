#openrc
#touch /run/openrc/softlevel
	php-fpm7 & nginx -g 'daemon off;'
#php -S 0.0.0.0:5000 -t /www/phpmyadmin