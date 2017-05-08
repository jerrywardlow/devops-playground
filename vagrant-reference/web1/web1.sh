# Apache
apt update && apt install -y apache2
a2enmod rewrite

mkdir -p /var/www/{blog.example.com,shop.example.com}
rm -rf /var/www/html

cp /web1/{blog.conf,shop.conf} /etc/apache2/sites-available/

a2dissite 000-default.conf
a2ensite blog.conf shop.conf

#PHP
apt install -y php libapache2-mod-php php-mcrypt php-mysql php-curl php-gd php-mbstring php-xml php-xmlrpc php-intl php-zip

# Restart Apache
systemctl restart apache2.service

#Blog
wget --quiet -P /tmp https://wordpress.org/latest.tar.gz 
tar xzf /tmp/latest.tar.gz -C /var/www/blog.example.com/ --strip 1
cp /var/www/blog.example.com/wp-config-sample.php /var/www/blog.example.com/wp-config.php
sed -i "/DB_NAME/c\define('DB_NAME', 'wordpress');" /var/www/blog.example.com/wp-config.php
sed -i "/DB_USER/c\define('DB_USER', 'wordpressuser');" /var/www/blog.example.com/wp-config.php
sed -i "/DB_PASSWORD/c\define('DB_PASSWORD', 'password');" /var/www/blog.example.com/wp-config.php
sed -i "/DB_HOST/c\define('DB_HOST', 'data');" /var/www/blog.example.com/wp-config.php

curl --data-urlencode "weblog_title=DREADNOUGHT" \
     --data-urlencode "user_name=user" \
     --data-urlencode "admin_password=complexpassword123#@!" \
     --data-urlencode "admin_password2=complexpassword123#@!" \
     --data-urlencode "admin_email=admin@example.com" \
     --data-urlencode "Submit=Install+WordPress" \
     --header "Host: blog.example.com" \
     http://localhost/wp-admin/install.php?step=2

#Shop
wget --quiet -P /tmp https://github.com/magento-2/magento-2-community-sample-data/archive/master.tar.gz
tar xzf /tmp/master.tar.gz -C /var/www/shop.example.com/ --strip 1
chmod +x /var/www/shop.example.com/bin/magento

/var/www/shop.example.com/bin/magento setup:install \
    --admin-firstname admin \
    --admin-lastname lastname \
    --admin-email admin@example.com \
    --admin-user user \
    --admin-password password123#@! \
    --db-host data \
    --db-name magento \
    --db-user magentouser \
    --db-password password

# Set ownership of web directories
chown -R www-data: /var/www/

# Restart Apache
systemctl restart apache2.service
