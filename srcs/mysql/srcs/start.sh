export TELEGRAF_CONFIG_PATH=/etc/telegraf.conf

openrc &> /dev/null
touch /run/openrc/softlevel
/etc/init.d/mariadb setup &> /dev/null
sed -i 's/skip-networking/# skip-networking/g' /etc/my.cnf.d/mariadb-server.cnf
service mariadb restart &> /dev/null

mysql --user=root << EOF
CREATE DATABASE wordpress;
CREATE USER 'wp_user'@'%' IDENTIFIED BY 'passwd';
GRANT ALL ON wordpress.* TO 'wp_user'@'%' IDENTIFIED BY 'user' WITH GRANT OPTION;
CREATE USER 'admin'@'%' IDENTIFIED BY 'admin';
GRANT ALL ON *.* TO 'admin'@'%' IDENTIFIED BY 'admin' WITH GRANT OPTION;
FLUSH PRIVILEGES;
EOF

telegraf & 
mysql wordpress -u root < /root/wordpress.sql
/usr/bin/mysql_install_db --user=mysql --datadir="/var/lib/mysql"
/usr/bin/mysqld_safe --datadir="/var/lib/mysql"
tail -F /dev/null