#!/usr/bin/env bash

# Seed user-data with hostname
sed "s/%HOSTNAME%/$1/" user_data > /tmp/user_data_$1

sudo uvt-kvm create \
    --memory 1024 \
    --cpu 1 \
    --disk 10 \
    --bridge mainbr0 \
    --user-data /tmp/user_data_$1 \
    $1 \
    release=bionic
