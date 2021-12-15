#!/bin/sh

docker pull cr.portainer.io/portainer/portainer-ce:latest
docker stop portainer
docker rm portainer
docker run -d -p 9000:9000 --name portainer \
    --restart always \
    -v /var/run/docker.sock:/var/run/docker.sock  \
    -v portainer_data:/data  \
    cr.portainer.io/portainer/portainer-ce:latest

