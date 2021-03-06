#!/bin/sh
echo "Pulling latest and updating container..."
docker pull homeassistant/home-assistant
docker stop home-assistant-image-detection
docker rm home-assistant-image-detection
docker-compose -f docker-compose.yml up --no-recreate -d
echo "Running post installs in container..."
docker-compose exec home-assistant-image-detection /etc/docker-init/home-assistant-image-detection.init.sh
echo -n "Restarting containeer: "
docker restart home-assistant-image-detection
