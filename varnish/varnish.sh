#!/usr/bin/env bash

yum install -y epel-release

yum install -y htop net-tools nginx varnish

sed -i "/VARNISH_LISTEN_PORT/c\VARNISH_LISTEN_PORT=80" /etc/varnish/varnish.params

sed -i "0,/80/s//8080/"  /etc/nginx/nginx.conf

systemctl restart nginx

systemctl restart varnish
