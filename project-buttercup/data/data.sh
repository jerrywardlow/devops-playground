#MySQL
echo "mysql-server mysql-server/root_password password rootpassword" | debconf-set-selections
echo "mysql-server mysql-server/root_password_again password rootpassword" | debconf-set-selections

apt update && apt install -y mysql-server

sed -i "/bind-address/c\bind-address = *" /etc/mysql/mysql.conf.d/mysqld.cnf

mysql -uroot -prootpassword -e "CREATE DATABASE IF NOT EXISTS wordpress;"
mysql -uroot -prootpassword -e "CREATE USER 'wordpressuser'@'web1' IDENTIFIED BY 'password';
                                GRANT ALL PRIVILEGES ON wordpress.* TO 'wordpressuser'@'web1';
                                FLUSH PRIVILEGES;"

mysql -uroot -prootpassword -e "CREATE DATABASE IF NOT EXISTS magento;"
mysql -uroot -prootpassword -e "CREATE USER 'magentouser'@'web1' IDENTIFIED BY 'password';
                                GRANT ALL PRIVILEGES ON magento.* TO 'magentouser'@'web1';
                                FLUSH PRIVILEGES;"

systemctl restart mysql.service


# MongoDB
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927
echo "deb http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.2 multiverse" >> /etc/apt/sources.list.d/mongodb-org-3.2.list

apt update && apt install -y mongodb-org

systemctl enable mongod.service
systemctl start mongod.service

sleep 5 # Timing issue with starting mongod.service

mongo /data/user.js

sed -i "/bindIp/c\  bindIp: 0.0.0.0" /etc/mongod.conf

systemctl restart mongod.service
