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
