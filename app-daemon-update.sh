#!/bin/sh
echo "Pulling latest and updating container..."
docker pull acockburn/appdaemon:latest
docker stop app-daemon
docker rm app-daemon
docker-compose -f docker-compose.yml up --no-recreate -d
