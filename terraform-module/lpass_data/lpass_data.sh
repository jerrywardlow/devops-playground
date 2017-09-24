#!/usr/bin/env sh

eval "$(jq -r '@sh "PROJECT=\(.project)"')"

# Check if logged in to LastPass
if ! lpass status | grep -q "Logged in as " ; then
    echo " " >&2 # HACK: Terraform won't interpret \n
    echo " " >&2
    echo "Please login to LastPass CLI" >&2
    echo "EXAMPLE" >&2
    echo "    $ lpass login username@example.com" >&2
    exit 1
fi

DO_TOKEN=$(lpass show "$PROJECT/DigitalOcean API Token - Terraform" --notes)
GITHUB_TOKEN=$(lpass show "$PROJECT/GitHub Deploy Token" --notes)

jq -n --arg do_token "$DO_TOKEN" '{"do_token":$do_token}'
