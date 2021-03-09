#!/bin/sh

echo "#########################################"
echo "#### Initiating container..."
echo "#########################################"
echo ""


echo "####  update packages"
apk update

echo "### Determine python major command/version"
PYTHON_COMMAND_PATH=`which python`
PYTHON_MAJOR_COMMAND=`readlink $PYTHON_COMMAND_PATH`
PYTHON_DEV_PACKAGE_NAME="$PYTHON_MAJOR_COMMAND-dev"

echo "#### Install dependencies..."
echo "insalling ffmpeg..."
apk add ffmpeg
echo "insalling libffi-dev..."
apk add libffi-dev
echo "insalling bluez..."
apk add bluez
echo "insalling $PYTHON_DEV_PACKAGE_NAME..."
apk add $PYTHON_DEV_PACKAGE_NAME

echo ""
echo "#########################################"
echo "#### Initiating done!"
echo "#########################################"

