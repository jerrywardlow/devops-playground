#!/bin/bash

yum -y install \
    wget \
    nmap \
    perl-Data-Dumper

yum -y remove \
    mariadb-libs

wget http://dev.mysql.com/get/Downloads/MySQL-Cluster-7.5/mysql-cluster-gpl-7.5.4-1.el7.x86_64.rpm-bundle.tar
tar -xvf mysql-cluster*.tar