#!/bin/sh
docker pull containrrr/watchtower
docker stop watchtower
docker rm watchtower
docker run -d \
  --name watchtower \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -e WATCHTOWER_POLL_INTERVAL=20000 -e WATCHTOWER_LABEL_ENABLE=true -e WATCHTOWER_MONITOR_ONLY=true \
  --env-file ./.watchtower.env \
  containrrr/watchtower --debug
