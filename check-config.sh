#!/bin/sh

#VERSION=2021.3.1
VERSION=latest
#IMAGE=homeassistant/intel-nuc-homeassistant:$VERSION
IMAGE=homeassistant/home-assistant:$VERSION


docker pull $IMAGE
docker run -it --rm -v /srv/docker/homeautomation/ha-home:/config:ro -v /etc/localtime:/etc/localtime:ro $IMAGE hass -c /config --script check_config
