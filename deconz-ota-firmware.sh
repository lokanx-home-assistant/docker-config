#!/bin/sh
echo "Downloading IKEA firmware..."
docker-compose exec deconz /ikea-ota-download.py
echo "Restarting container... "
docker restart deconz
echo "Now power-cycle devices to start firmware updates..."

