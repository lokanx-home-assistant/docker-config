#!/bin/sh
echo "Pulling latest and updating container..."
docker pull deconzcommunity/deconz:stable
docker stop deconz
docker rm deconz
docker-compose -f docker-compose.yml up --no-recreate -d
echo "Running post installs in container..."echo "Running post installs in container..."
echo "####  apt-get update"
docker-compose exec deconz apt update

echo "#### Install dependencies..."
docker-compose exec deconz apt -y install python

