<?php
define('DB_NAME', 'wordpress');
define('DB_USER', 'wordpressuser');
define('DB_PASSWORD', 'password');
define('DB_HOST', 'data');
define('DB_CHARSET', 'utf8');
define('DB_COLLATE', '');

define('AUTH_KEY',         'nope');
define('SECURE_AUTH_KEY',  'doesnt matter');
define('LOGGED_IN_KEY',    'why');
define('NONCE_KEY',        'make me');
define('AUTH_SALT',        'good enough');
define('SECURE_AUTH_SALT', 'does this count');
define('LOGGED_IN_SALT',   'am i doing it right');
define('NONCE_SALT',       'i tried');

$table_prefix  = 'wp_';

define('WP_DEBUG', false);

if ( !defined('ABSPATH')  )
        define('ABSPATH', dirname(__FILE__) . '/');

require_once(ABSPATH . 'wp-settings.php');
