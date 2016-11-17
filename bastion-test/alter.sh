#! /bin/bash
set -e

# Query for bastion IP
echo "Querying AWS for Bastion public IP address..."
BASTION_IP=$(aws ec2 describe-instances --filters Name=tag:Name,Values=bastion --output text --query 'Reservations[0].Instances[0].PublicIpAddress')
echo "Bastion IP: ${BASTION_IP}"

# Generate config file with queried IP
sed "s/HOST_NAME/${BASTION_IP}/g" sample.cfg.template > sample.cfg
echo "SSH config generated" 
