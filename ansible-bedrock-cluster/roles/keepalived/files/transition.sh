#!/usr/bin/env bash

case $3 in
    'MASTER')
        wait 5
        systemctl restart haproxy
    ;;
    'BACKUP'|'FAULT')
        systemctl stop haproxy
    ;;
esac

exit 0
