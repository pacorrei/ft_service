	export TELEGRAF_CONFIG_PATH=/etc/telegraf.conf
	php-fpm7 & nginx -g 'daemon off;'
	 & telegraf