#!/bin/bash

sudo apt update
sudo apt install -y \
    libaio1

wget http://dev.mysql.com/get/Downloads/MySQL-Cluster-7.5/mysql-cluster-gpl-7.5.4-debian8-x86_64.deb
sudo dpkg -i mysql-cluster*.deb

sudo mkdir -p /var/lib/mysql-cluster

cat > /var/lib/mysql-cluster/config.ini << EOF
[ndb_mgmd]
hostname=master.sql.cluster
datadir=/var/lib/mysql-cluster

[ndbd]
hostname=node1.sql.cluster
datadir=/usr/local/mysql/data

[ndbd]
hostname=node2.sql.cluster
datadir=/usr/local/mysql/data

[mysqld]
hostname=master.sql.cluster
EOF

sudo /opt/mysql/server-5.7/bin/ndb_mgmd -f /var/lib/mysql-cluster/config.ini
