#!/bin/sh

docker run -d \
  --name watchtower \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -e WATCHTOWER_POLL_INTERVAL=43200 -e WATCHTOWER_LABEL_ENABLE=true -e WATCHTOWER_MONITOR_ONLY=true \
  --env-file ./.watchtower.env --label=com.centurylinklabs.watchtower.enable=true \
  containrrr/watchtower --debug
