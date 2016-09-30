# Update apt cache
sudo apt-get update

# Set debconf for postfix
echo "postfix postfix/mailname string test.wordpress.cloud" | sudo debconf-set-selections
echo "postfix postfix/main_mailer_type string 'Internet Site'" | sudo debconf-set-selections

# Install packages
sudo apt-get install -y \
                     apache2 \
                     php5 \
                     php5-cli \
                     php5-fpm \
                     php5-gd \
                     libssh2-php \
                     libapache2-mod-php5 \
                     php5-mcrypt \
                     php5-mysql \
                     git \
                     unzip \
                     zip \
                     postfix \
                     php5-curl \
                     mailutils \
                     php5-json 

# Enable mod_rewrite and mod_headers
sudo a2enmod rewrite headers

# Enable mcrypt
sudo php5enmod mcrypt

# Disable default Apache site
sudo a2dissite 000-default.conf
sudo rm -rf /var/www/html

# Install Wordpress
wget https://wordpress.org/latest.tar.gz
sudo tar -xzvf latest.tar.gz -C /var/www/
sudo chmod -R 744 /var/www/wordpress/
sudo chown -R www-data:www-data /var/www/wordpress/
sudo mv /tmp/wp-config.php /var/www/wordpress/wp-config.php

# Install Wordpress CLI tool
sudo curl -o /usr/local/bin/wpcli https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
sudo chmod +x /usr/local/bin/wpcli

# Install Wordpress plugins
sudo wpcli plugin install --allow-root --path=/var/www/wordpress/ --activate \
                          amazon-web-services \
                          amazon-s3-and-cloudfront \
                          redis-cache

# Enable Wordpress virtual host
sudo mv /tmp/wordpress.conf /etc/apache2/sites-available/wordpress.conf
sudo a2ensite wordpress.conf

# Restart Apache
sudo service apache2 reload
