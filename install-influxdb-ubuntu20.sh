[1:57 PM] Aviram Booxbaum
    #!/bin/bash
#
#This script install influxDB on Ubuntu 20.X
#on installation script edit influxdb.conf value of block http enabled to true
#download InfluxDB repo's
curl -sL https://repos.influxdata.com/influxdb.key | sudo apt-key add -
echo "deb https://repos.influxdata.com/ubuntu bionic stable" | sudo tee /etc/apt/sources.list.d/influxdb.list
echo "deb https://repos.influxdata.com/ubuntu bionic stable" | sudo tee /etc/apt/sources.list.d/influxdb.list
#
#update and install DB
apt update
apt install influxdb -y
#check installation and service status
systemctl status influxdb
#enable on start and start DB
systemctl enable --now influxdb
systemctl start influxdb
#enable web access and restart service
sed -i '22121a\   enabled = true' "/etc/influxdb/influxdb.conf"
systemctl stop influxdb && sudo systemctl start influxdb
#install client to access DB
apt install influxdb-client
#setup admin user accounbt for DB and install curl in case does not exist
apt install curl -y
curl -XPOST "http://localhost:8086/query" --data-urlencode "q=CREATE USER admin WITH PASSWORD 'password' WITH ALL PRIVILEGES"
