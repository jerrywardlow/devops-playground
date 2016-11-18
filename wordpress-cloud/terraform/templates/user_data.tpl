#cloud-config

runcmd:
 - sed "s/RDS_ENDPOINT/${rds_endpoint}/g" /var/www/wordpress/wp-config.php
