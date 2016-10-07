#!/bin/bash

# Shell script to chain Packer output into Terraform
# Packer builds image against wordpress.json, tagging AMI artifact with a UUID
# AWS is queried for this tag, returning the AMI ID
# Terraform is run with this AMI ID as an agrument against a variable

# Generate UUID
UUID=$(uuid -v5)

# Pass UUID to Packer when building image, overriding `packer_uuid` variable
packer build wordpress.json -var packer_uuid=${UUID}

# Query AWS for image with same UUID tag
AMI_ID=$(aws ec2 describe-images --filters Name=tag:packer_uuid,Values=${UUID} --output text --query 'Images[0].ImageId')

# Run Terraform with new AMI ID
terraform apply -var ubuntu-ami=${AMI_ID}
