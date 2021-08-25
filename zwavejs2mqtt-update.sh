#!/bin/sh
echo "Pulling latest and updating container..."
docker pull zwavejs/zwavejs2mqtt
docker stop zwavejs2mqtt
docker rm zwavejs2mqtt
docker-compose -f docker-compose.yml up --no-recreate -d
#echo "Running post installs in container..."echo "Running post installs in container..."
#echo "####  apt-get update"
#docker-compose exec zwave2mqtt apk update

#echo "#### Install dependencies..."
