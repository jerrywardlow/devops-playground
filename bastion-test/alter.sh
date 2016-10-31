#! /bin/bash
set -e

sed "s/HOST_NAME/172.10.0.0/g" sample.cfg.template > sample.cfg
