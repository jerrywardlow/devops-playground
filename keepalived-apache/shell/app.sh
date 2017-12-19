#!/usr/bin/env bash

apt update && apt install -y apache2

echo "Served from $HOSTNAME" > /var/www/html/index.html
