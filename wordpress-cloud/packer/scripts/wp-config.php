<?php
define('DB_NAME', 'wordpress');
define('DB_USER', 'wordpress');
define('DB_PASSWORD', 'wordpress');
define('DB_HOST', ''); /** RDS host */
define('DB_CHARSET', 'utf8mb4');
define('DB_COLLATE', '');

define('AUTH_KEY',         '|{)aPBY[Gva*XZ|)4YuF?6g5Y >q0L&?`$M]a,O}9_V5;`-<(A.ffQ&zirVM|DW_');
define('SECURE_AUTH_KEY',  '8!kLvW}El- j},CHrFYwKQYeotmH*b?1fHd~ytXw]-<fhn{[~g/nUZ;_TK((*.~y');
define('LOGGED_IN_KEY',    '%)4YP8%4g)mrL4@FTPEh @PPXioBWQ*aArd`P}niz>JsCrZv`79<K{gd<WJz+I3c');
define('NONCE_KEY',        'vtAQ+-fs}qUdudf_OtCKTS3NGx<T&Ww <+.y(.)VibW2*bdf>#0bRwbE+,R`7Bvx');
define('AUTH_SALT',        '!pF[aQ[*-!R}>Pntr*ZS,b^<ADI@e[>pC>,h1}o]8,0[vgIC5!J:1(#7 Tkw5DE:');
define('SECURE_AUTH_SALT', '^M6ULTP i.a4T}wC%FD$*s2kfC#3U(hO,z;Xa>!u/0tRoF662eIdY!3v-G6-x[JF');
define('LOGGED_IN_SALT',   '-^7EYHP%Ou^o`:y1,55 ]R;)lx01seGO+`GLKB^%S!O~iP-Y$J>4b.$jcoBc19<.');
define('NONCE_SALT',       'Q54<y!1#V;BRx7q6[Krtj8L{$xV]kG6%p-GUk{VBaD,1{U]@I<odX`2qCOS9X}V_');

$table_prefix  = 'wp_';

define('WP_DEBUG', false);

if ( !defined('ABSPATH') )
        define('ABSPATH', dirname(__FILE__) . '/');

require_once(ABSPATH . 'wp-settings.php');
