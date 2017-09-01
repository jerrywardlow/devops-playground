#!/usr/bin/env sh

WAPPLE_GLOBAL="wapple-string"

# Pull data from Terraform query injection
eval "$(jq -r '@sh "EXAMPLE=\(.example)"')"

jq -n --arg wapple_minor "$WAPPLE_GLOBAL" --arg example "$EXAMPLE"'{"wapple":$wapple_minor, "example":$example}'
