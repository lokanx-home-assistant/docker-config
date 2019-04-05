#!/bin/sh
echo "Pulling latest and updating container..."
docker pull ghcr.io/linuxserver/swag
docker stop swag
docker rm swag
docker-compose -f docker-compose.yml up --no-recreate -d
echo "Running post installs in container..."
#echo "####  apt-get update"
#docker-compose exec zwave2mqtt apk update

#echo "#### Install dependencies..."
