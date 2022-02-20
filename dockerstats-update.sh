#!/bin/sh

docker pull virtualzone/docker-container-stats
docker stop docker-stats
docker rm docker-stats
docker run \
        -d \
        -p 18080:8080 \
        --volume=/var/run/docker.sock:/var/run/docker.sock:ro \
        --volume=/srv/docker/docker-stats/db:/opt/docker-stats/db \
        --name docker-stats \
        --restart always \
        --label "com.centurylinklabs.watchtower.enable=true" \
        -e STATS_UPDATE_INTERVAL=10 \
        virtualzone/docker-container-stats

