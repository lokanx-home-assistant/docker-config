#!/bin/sh
echo "Pulling latest and updating container..."
docker pull eclipse-mosquitto
docker stop mosquitto
docker rm mosquitto
docker-compose -f docker-compose.yml up --no-recreate -d
