#!/bin/bash

# Verifies that requirements are satisfied before deployment

set -u
set -e

# Check that Packer, Terraform, and Ansible are available

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

# Check environment variables

if [ -z ${AWS_ACCESS_KEY_ID+x} ];
    echo "AWS_ACCESS_KEY_ID is unset"
    exit 1
fi

if [ -z ${AWS_SECRET_ACCESS_KEY+x} ];
    echo "AWS_SECRET_ACCESS_KEY is unset"
    exit 1
fi

