#!/bin/sh
docker pull containrrr/watchtower
docker stop watchtower
docker rm watchtower
docker run -d \
  --name watchtower \
  --restart always \
  --env-file ./.watchtower.env \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -e WATCHTOWER_POLL_INTERVAL=20000  \
  -e WATCHTOWER_LABEL_ENABLE=true  \
  -e WATCHTOWER_MONITOR_ONLY=true \
  -e WATCHTOWER_NOTIFICATIONS_LEVEL=info \
  -e WATCHTOWER_NO_STARTUP_MESSAGE=true \
  -e WATCHTOWER_NOTIFICATIONS=shoutrrr \
  -e WATCHTOWER_NOTIFICATION_TEMPLATE='{{range .}}{{println}}{ {{println}}"date":"{{.Time.Format "2006-01-02 15:04:05"}}",{{println}}"level":"{{.Level}}",{{println}}"message":"{{.Message}}"{{println}} } {{println}}{{end}}' \
  containrrr/watchtower --debug
