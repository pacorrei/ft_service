openrc &> /dev/null
touch /run/openrc/softlevel
/etc/init.d/mariadb setup &> /dev/null
sed -i 's/skip-networking/# skip-networking/g' /etc/my.cnf.d/mariadb-server.cnf
service mariadb restart &> /dev/null

mysql --user=root << EOF
  CREATE DATABASE wordpress;
  CREATE USER 'wp_user'@'%' IDENTIFIED BY 'passwd';
  GRANT ALL ON wordpress.* TO 'wp_user'@'%' IDENTIFIED BY 'passwd' WITH GRANT OPTION;
  CREATE USER 'admin'@'%' IDENTIFIED BY '$admin';
  GRANT ALL ON *.* TO 'admin'@'%' IDENTIFIED BY 'admin' WITH GRANT OPTION;
  FLUSH PRIVILEGES;
EOF

mysql --user=root wordpress < /root/wordpress.sql

printf "Database started !\n"

tail -F /dev/null