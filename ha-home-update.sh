#!/bin/sh
echo "Pulling latest and updating container..."
docker pull homeassistant/home-assistant
docker stop home-assistant-home
docker rm home-assistant-home
docker-compose -f docker-compose.yml up --no-recreate -d
echo "Running post installs in container..."
docker-compose exec home-assistant-home /etc/docker-init/home-assistant-home.init.sh
echo -n "Restarting container: "
docker restart home-assistant-home
