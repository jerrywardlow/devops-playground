#!/usr/bin/env bash

apt update
apt install -y htop strace net-tools curl

curl -s https://getcaddy.com | bash

mkdir -p /etc/caddy/
chown root:www-data /etc/caddy

cp /vagrant/Caddyfile /etc/caddy/

mkdir -p /var/www/caddy/
echo "Become the Mazda Miata you want to see in the world" >> /var/www/caddy/index.html

curl -s https://raw.githubusercontent.com/mholt/caddy/master/dist/init/linux-systemd/caddy.service -o /etc/systemd/system/caddy.service

systemctl daemon-reload

systemctl enable caddy.service
