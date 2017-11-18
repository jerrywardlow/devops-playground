#!/usr/bin/env sh

# K8s
curl -fsSL https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
sudo add-apt-repository "deb https://apt.kubernetes.io/ kubernetes-xenial main"
apt-get update
apt-get install -y kubeadm
