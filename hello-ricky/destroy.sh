#!/bin/sh

# Script to destroy servers

set -e

set -u

# Run terraform to destroy infrastructure
terraform destroy
