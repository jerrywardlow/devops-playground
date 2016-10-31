#! /bin/bash
set -e

# Query for bastion IP
BASTION_IP=$(aws ec2 describe-instances --filters Name=tag:name,Values=bastion --output text --query 'Reservations[0].Instances[0].PublicIpAddress')

# Generate config file with queried IP
sed "s/HOST_NAME/${BASTION_IP}/g" sample.cfg.template > sample.cfg
