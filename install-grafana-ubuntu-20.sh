
#!/bin/bash
#
#this script install grafana on ubuntu 20.X
#add grafana repo's
wget -q -O - https://packages.grafana.com/gpg.key | sudo apt-key add -
add-apt-repository "deb https://packages.grafana.com/oss/deb stable main"
#update and install grafana
apt update
apt install grafana
#enable service on start and start service
systemctl start grafana-server
systemctl enable grafana-server
