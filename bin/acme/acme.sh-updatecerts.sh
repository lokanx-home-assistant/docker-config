#!/usr/bin/env sh

#Here is a sample custom api script.
#This file name is "zipcerts.sh"
#So, here must be a method  zipcerts_deploy()
#Which will be called by acme.sh to deploy the cert
#returns 0 means success, otherwise error.

########  Public functions #####################
PASSWORD=MySuperN0tS3curePa$$w0oRd

#domain keyfile certfile cafile fullchain
updatecerts_deploy() {
  _cdomain="$1"
  _ckey="$2"
  _ccert="$3"
  _cca="$4"
  _cfullchain="$5"

  _debug _cdomain "About to update certificates for domain: $_cdomain"
  _debug _ckey "$_ckey"
  _debug _ccert "$_ccert"
  _debug _cca "$_cca"
  _debug _cfullchain "$_cfullchain"


  zip -P ${PASSWORD} ${_cdomain}.zip $_ckey $_ccert $_cca $_cfullchain
  if [ $? -eq 0 ] ; then
      _debug _cdomain "About to update certificates for domain: $_cdomain"
      return 0
  fi

  # Compress files
  _err "Update of certificates for domain $_cdomain failed!"
  return 1

}