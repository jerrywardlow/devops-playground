#!/usr/bin/env bash

[[ "$DEBUG" ]] && set -x

set -eo pipefail

WORKING_DIR="$( cd "$(dirname "${BASH_SOURCE[0]}" )" && pwd  )"

# Check for dependencies
if ! hash lpass 2>/dev/null; then
    echo "Missing dependency: LastPass CLI tool"
    echo "https://github.com/lastpass/lastpass-cli#installing-on-os-x"
    exit 1
fi

if ! hash terraform 2>/dev/null; then
    echo "Missing dependency: Terraform"
    echo "https://www.terraform.io/downloads.html"
    exit 1
fi

# Check if logged in to LastPass
if ! lpass status | grep -q "Logged in as " ; then
    echo "Please login to LastPass CLI"
    echo "EXAMPLE"
    echo "    $ lpass login username@example.com"
    exit 1
fi

# ---Boring shell script stuff---

function usage {
cat <<EOF
Usage: ${0} -e ENVIRONMENT COMMAND
    ENVIRONMENT
        production
        staging

    COMMAND
        Any Terraform command

    OPTIONS
        -h
            This message
        -e ENVIRONMENT
            Set the Terraform environment

    EXAMPLE
        $ ./scripts/tf -e staging plan
EOF
}

while getopts "he:" opt
do
    case $opt in
        h)
            usage; exit 0
            ;;
        e)
            environment=$OPTARG
            ;;
    esac
done

# If $environment is unset, query the user for input
if [[ -z $environment ]]; then
    read -p "Please specify an environment {staging|production}: " environment
fi

# Drop short flag if used
if [ "$2" == "staging" ] || [ "$2" == "production" ]; then
    shift 2
fi

# List of arguments to pass to 'terraform'
args="$@"

# ---Back to Terraform stuff---

# Assign TF_VAR environment variables
# DigitalOcean access token
export TF_VAR_do_token=`lpass show 'Example' 'DigitalOcean API Token' --notes`
# Chef secret key
export TF_VAR_chef_secret=`lpass show 'Example' 'Chef secret key' --notes`
# GitHub SSH key - base64 encoded
export TF_VAR_github_ssh_key=`lpass show 'Example' 'GitHub SSH Key' --field='Private Key' | base64`

(cd "$WORKING_DIR/terraform/$environment" && terraform $args)
