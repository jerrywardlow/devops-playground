#!/usr/bin/env sh

docker pull rancher/server:preview

docker run -d --restart=unless-stopped -p 80:8080 rancher/server:preview
