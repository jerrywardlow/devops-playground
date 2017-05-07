apt update && apt install -y haproxy

cp /lb/haproxy.cfg /etc/haproxy/haproxy.cfg

systemctl restart haproxy.service
systemctl restart networking.service
