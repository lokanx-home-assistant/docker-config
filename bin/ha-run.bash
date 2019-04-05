#!/usr/bin/with-contenv bashio
# ==============================================================================
# Start Home Assistant service
# ==============================================================================
cd /config || bashio::exit.nok "Can't find config folder!"

exec python3 -m homeassistant --config /config --log-rotate-days 7
