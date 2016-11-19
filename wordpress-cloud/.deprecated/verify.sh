#!/bin/bash

# Verifies that requirements are satisfied before deployment

set -u
set -e

# Check that Packer, Terraform, and Ansible are available

if ! hash packer 2>/dev/null; then
  echo "Missing dependency: Packer"
fi

if ! hash terraform 2>/dev/null; then
  echo "Missing dependency: Terraform"
fi

if ! hash ansible 2>/dev/null; then
  echo "Missing dependency: Ansible"
fi

# Check environment variables

if [ -z ${AWS_ACCESS_KEY_ID+x} ]; then
    echo "AWS_ACCESS_KEY_ID is unset"
fi

if [ -z ${AWS_SECRET_ACCESS_KEY+x} ]; then
    echo "AWS_SECRET_ACCESS_KEY is unset"
fi

