# Become root
sudo su

# Update apt cache
apt-get update

# Set debconf for postfix
echo "postfix postfix/mailname string test.wordpress.cloud" | debconf-set-selections
echo "postfix postfix/main_mailer_type string 'Internet Site'" | debconf-set-selections

# Install packages
apt-get install -y \
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
