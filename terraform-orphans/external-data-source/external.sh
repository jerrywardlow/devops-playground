#!/usr/bin/env sh

WAPPLE_GLOBAL="wapple-string"

jq -n --arg wapple_minor "$WAPPLE_GLOBAL" '{"wapple":$wapple_minor}'
