#!/usr/bin/env bash

curl -L https://bootstrap.saltstack.com | sudo sh -s -- -M
sudo salt-key -y -A
sudo salt '*' mine.update
salt '*' state.apply
