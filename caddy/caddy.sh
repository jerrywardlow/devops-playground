#!/usr/bin/env bash

apt update
apt install -y htop strace net-tools curl

curl -s https://getcaddy.com | bash

mkdir -p /etc/caddy/
chown root:www-data /etc/caddy

cp /vagrant/Caddyfile /etc/caddy/

mkdir -p /var/www/caddy/
echo "Become the Mazda Miata you want to see in the world" >> /var/www/caddy/index.html
