#!/bin/bash

# Shell script to chain Packer output into Terraform before Ansible config
# Packer builds image against wordpress.json, tagging AMI artifact with a UUID
# AWS is queried for this tag, returning the AMI ID
# Terraform is run with this AMI ID as an agrument against a variable
# Finally, Ansible is run to update web servers with RDS endpoint

set -u
set -e

# Make sure Packer, Terraform, and Ansible are installed
if ! hash packer 2>/dev/null; then
    echo "Missing dependency: Packer"
    exit 1
fi

if ! hash terraform 2>/dev/null; then
    echo "Missing dependency: Terraform"
    exit 1
fi

if ! hash ansible 2>/dev/null; then
    echo "Missing dependency: Ansible"
    exit 1
fi

# Generate UUID. Uses timestamp if uuid is unavailable.
if hash uuid 2>/dev/null; then
    UUID=$(uuid -v4)
else
    UUID=$(date +"%Y%m%d%H%M%S")
fi

# Pass UUID to Packer when building image, overriding `packer_uuid` variable
(cd packer/ && exec packer build -var packer_uuid=${UUID} wordpress.json)

# Query AWS for image with same UUID tag
AMI_ID=$(aws ec2 describe-images --filters Name=tag:packer_uuid,Values=${UUID} --output text --query 'Images[0].ImageId')

# Log generated AMI, including failure to query
echo $(date) ${AMI_ID} >> ami_log

# Ditch out if there was a problem querying for the AMI
if [ "$AMI_ID" == "None" ]; then
    exit 1
fi

# Run Terraform with new AMI ID
(cd terraform/ && exec terraform apply -var ubuntu-ami=${AMI_ID})

# Query AWS for RDS endpoint
RDS_ENDPOINT=$(aws rds describe-db-instances --db-instance-identifier wordpress-mysql --output text --query 'DBInstances[0].Endpoint.Address')

# Query AWS for bastion IP
BASTION_IP=$(aws ec2 describe-instances --filters Name=tag:Name,Values=bastion --output text --query 'Reservations[0].Instances[0].PublicIpAddress')

# Generate SSH forwarding config file
sed "s/BASTION_HOST/${BASTION_IP}/g" ansible/ssh/ssh.cfg.template >> ansible/ssh/ssh.cfg

# Spawn ssh-agent and load wordpress-key
eval `ssh-agent`
ssh-add terraform/ssh/wordpress-key

# Execute Ansible playbook against production instances
(cd ansible/ && ansible-playbook playbook.yml --extra-vars "rds_endpoint=${RDS_ENDPOINT}")

# Kill ssh-agent
ssh-agent -k
