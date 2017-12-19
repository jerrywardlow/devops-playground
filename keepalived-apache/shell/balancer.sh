#!/usr/bin/env bash

# Apache shenanigans
apt update && apt install -y apache2

a2dissite 000-default.conf

cp /tmp/site.conf /etc/apache2/sites-available/
a2ensite site.conf

a2enmod proxy proxy_http proxy_balancer lbmethod_byrequests

systemctl restart apache2


# Keepalived shenanigans
apt install -y keepalived

cp /tmp/keepalived.conf /etc/keepalived/

systemctl start keepalived
