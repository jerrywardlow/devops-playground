#!/bin/sh

set -eu

curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -

sudo apt-get install -y nodejs node-gyp

sudo npm install -g tty.js pm2

pm2 start tty.js
