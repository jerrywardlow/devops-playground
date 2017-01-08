#!/bin/sh

# Shell script to initialize project infrastructure and provide user with
# additional feedback

set -e # Ditch out if there is a problem executing a command

set -u # Exit if an unset variable is referenced

# Check to see that Terraform is installed
if ! hash terraform 2>/dev/null; then
    echo "Missing Terraform: https://www.terraform.io/intro/getting-started/install.html"
    exit 1
fi

# Make sure AWS specific environment variables are set
: "${AWS_ACCESS_KEY_ID:?Need to set AWS Access Key}"
: "${AWS_SECRET_ACCESS_KEY:?Need to set AWS Secret Key}"

# Run Terraform to generate the infrastructure
exec terraform apply

# Provide the user with some information about the environment
echo "Login to the web and database servers with user 'deploy'" 

