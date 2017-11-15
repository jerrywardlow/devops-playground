#!/usr/bin/env sh

apt-get update

apt-get install -y python-minimal

# Docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu xenial stable"
apt-get update
apt-get install docker-ce

# etcd
docker pull rancher/etcd:v3.2.9-1
