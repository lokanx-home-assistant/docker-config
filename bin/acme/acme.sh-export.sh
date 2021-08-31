#!/bin/sh
FOLDER_NAME=$(echo "${DOMAIN_NAME}" | tr '.' '-')
acme.sh --install-cert -d "${DOMAIN_NAME}" \
--cert-file      /certs/${FOLDER_NAME}/cert.pem  \
--key-file       /certs/${FOLDER_NAME}/key.pem  \
--fullchain-file /certs/${FOLDER_NAME}/fullchain.pem
