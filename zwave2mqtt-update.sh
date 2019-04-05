#!/bin/sh
echo "Pulling latest and updating container..."
docker pull robertslando/zwave2mqtt
docker stop zwave2mqtt
docker rm zwave2mqtt
docker-compose -f docker-compose.yml up --no-recreate -d
echo "Running post installs in container..."echo "Running post installs in container..."
echo "####  apt-get update"
docker-compose exec zwave2mqtt apk update

echo "#### Install dependencies..."
