#!/usr/bin/env bash

apt update
apt install -y htop strace net-tools curl

curl -s https://getcaddy.com | bash
