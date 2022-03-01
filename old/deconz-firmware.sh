#!/bin/sh
echo "Check logs for new firmware version..."
docker stop deconz
echo "FYI ... conbee path: /dev/ttyUSB0"
echo "Now follow the instructions..."
docker run -it --rm --entrypoint "/firmware-update.sh" --privileged --cap-add=ALL -v /dev:/dev -v /lib/modules:/lib/modules -v /sys:/sys marthoc/deconz
