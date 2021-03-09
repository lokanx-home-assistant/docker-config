#!/bin/sh
echo "Pulling latest and updating container..."
docker pull marthoc/deconz
docker stop deconz
docker rm deconz
docker-compose -f docker-compose.yml up --no-recreate -d
echo "Running post installs in container..."echo "Running post installs in container..."
echo "####  apt-get update"
docker-compose exec deconz apt update

echo "#### Install dependencies..."
docker-compose exec deconz apt -y install python
#docker-compose exec deconz unshare --net /lib/systemd/systemd-udevd --daemon
#docker-compose exec deconz udevadm trigger
#docker restart deconz

#SYMLINK_TARGET=`readlink -f /dev/ttyACM-ZIGBEE`
#docker-compose exec deconz ln -s $SYMLINK_TARGET /dev/ttyACM-ZIGBEE
#docker restart deconz
