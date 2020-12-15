/usr/sbin/influxd &

sleep 2

echo "CREATE DATABASE telegraf" | influx
echo "CREATE USER admin WITH PASSWORD 'passwd' WITH ALL PRIVILEGES" | influx

telegraf &

sleep infinity