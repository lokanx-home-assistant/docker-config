#!/bin/sh

# https://hub.docker.com/r/neilpang/acme.sh/dockerfile
if [ ! -f /acme.sh/account.conf ]; then
    echo 'First startup'
    acme.sh --update-account --accountemail ${ACME_SH_EMAIL}
    echo 'Asking for certificates'
    acme.sh --issue \
        -d "${DOMAIN_NAME}"  \
        -d "*.${DOMAIN_NAME}" \
        --dns "${DNS_API}" \
        --dnssleep 30 \
        --server "${ACME_SH_CA}"

fi

echo 'Listing certs'
acme.sh --list
# Make the container keep running
/entry.sh daemon
