#!/bin/bash
# autor: Sergey Shimanskiy
# Get Info script used for Linux Ubuntu 16.04 (SystemD)
apt install -y lshw
clear
hostnamectl status | grep -E 'Operating System|Kernel|Architecture'
echo "===CPU==="
cat /proc/cpuinfo | grep -E 'model name|cpu cores'
echo "===MEMORY==="
free -mht
echo "===DISKS==="
lshw -short | grep /dev/sda
echo "===NETWORK INFO==="
ip addr show | grep -w inet | awk '{print $2}' 
echo "Gateway" $(netstat -rn | sed -n 3p | awk '{print $2}')
echo "DNS:"
cat /etc/resolv.conf | grep nameserver
echo "===WEB SERVER==="
echo "$(nginx -v)"
echo "Web-sites"
echo "config      DNS name         GET response"
echo "-----------------------------------------"
sites=$(ls /etc/nginx/sites-enabled/ | grep -v default)
for site in $sites; do
conf=$(echo "$site")
sitename=$(cat /etc/nginx/sites-enabled/$site | grep server_name | awk '{print $2}')
port=$(cat /etc/nginx/sites-enabled/$site | grep listen | grep -v "::" | awk '{print $2}')
resp=$(curl --head --silent $sitename | head -n1)
printf '%s\n' "$conf; $sitename:$port $resp"
done
echo " "
echo "===DATABASE SERVER==="
sudo -i -u postgres psql -U postgres -A -c "select version();" | sed -n 2p
#systemctl list-unit-files | grep "postgresql.service"
echo "Databases"
echo "-----------------------------------------"
list_db=$(sudo -i -u postgres psql -A -q -t -c "select datname from pg_database")
for db in $list_db ; do
#echo "$db" - $(sudo -i -u postgres psql -U postgres -A -c "select pg_database_size('$db')" | grep -v pg_database_size | grep -v "(1 row)")
echo "$db" - $(sudo -i -u postgres psql -U postgres -A -c "SELECT pg_size_pretty( pg_database_size( '$db' ) );" | grep -v pg_size_pretty | grep -v "(1 row)")
done
