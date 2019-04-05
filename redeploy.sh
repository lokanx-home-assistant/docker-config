#!/bin/sh

docker-compose down
docker-compose -f docker-compose.yml up --no-recreate -d
docker-compose exec home-assistant-image-detection /etc/docker-init/home-assistant-image-detection.init.sh

echo -n "Restarting: "
docker restart home-assistant-image-detection

docker-compose exec home-assistant-home /etc/docker-init/home-assistant-home.init.sh
echo -n "Restarting: "
docker restart home-assistant-home

