#!/bin/bash

# Shell script to chain Packer output into Terraform
# Packer builds image against wordpress.json, tagging AMI artifact with a UUID
# AWS is queried for this tag, returning the AMI ID
# Terraform is run with this AMI ID as an agrument against a variable

set -u
set -e

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

# Query AWS for jump box IP
JUMP_BOX_IP=$(aws ec2 describe-instances --filters Name=tag:Name,Values=jump-box --output text --query 'Reservations[0].Instances[0].PublicIpAddress')

# Generate SSH forwarding config file

# Check that SSH Agent has key loaded

# Execute Ansible playbook on jump box against production instances
