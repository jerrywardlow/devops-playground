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
