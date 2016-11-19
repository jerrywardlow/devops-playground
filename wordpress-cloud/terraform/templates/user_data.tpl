#cloud-config

runcmd:
 - sed -i "s/RDS_ENDPOINT/${rds_endpoint}/g" /var/www/wordpress/wp-config.php
