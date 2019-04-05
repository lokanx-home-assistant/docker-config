#!/bin/sh

echo "#########################################"
echo "#### Initiating container..."
echo "#########################################"
echo ""


echo "####  apt-get update"
apk update

echo "#### Install camera dependencies..."
apk add ffmpeg
apk add libffi-dev
apk add python-dev
apk add bluez

echo ""
echo "#########################################"
echo "#### Initiating done!"
echo "#########################################"

