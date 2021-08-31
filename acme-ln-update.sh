#!/bin/sh
echo "Pulling latest and updating container..."
docker pull neilpang/acme.sh:latest
docker stop acme-ln
docker rm acme-ln
docker-compose -f docker-compose.yml up --no-recreate -d
echo "Running post installs in container..."
#echo "####  apt-get update"
#docker-compose exec zwave2mqtt apk update

#echo "#### Install dependencies..."
