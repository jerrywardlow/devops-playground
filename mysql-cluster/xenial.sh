#!/bin/bash

sudo apt update
sudo apt install -y \
    libaio1

wget http://dev.mysql.com/get/Downloads/MySQL-Cluster-7.5/mysql-cluster-gpl-7.5.4-debian8-x86_64.deb
sudo dpkg -i mysql-cluster*.deb
