#!/bin/sh

function start_ngrokd(){
  DOMAIN=${DOMAIN+-domain=$DOMAIN}
  HTTP_ADDR=${HTTP_ADDR+-httpAddr=$HTTP_ADDR}
  HTTPS_ADDR=${HTTPS_ADDR+-httpsAddr=$HTTPS_ADDR}
  LOG=${LOG+-log=$LOG}
  LOG_LEVEL=${LOG_LEVEL+-log-level=$LOG_LEVEL}
  TLSCRT=${TLSCRT+-tlsCrt=$TLSCRT}
  TLSKEY=${TLSKEY+-tlsKey=$TLSKEY}
  TUNNELADDR=${TUNNELADDR+-tunnelAddr=$TUNNELADDR}
  OPTIONS="$DOMAIN $HTTP_ADDR $HTTPS_ADDR $LOG $LOG_LEVEL $TLSCRT $TLSKEY $TUNNELADDR"
  echo Current options: $OPTIONS
  ngrokd $OPTIONS
}

function start_ngrok(){
  AUTHTOKEN=${AUTHTOKEN+-authtoken=$AUTHTOKEN}
  CONFIG=${CONFIG+-config=$CONFIG}
  HOSTNAME=${HOSTNAME+-hostname=$HOSTNAME}
  HTTPAUTH=${HTTPAUTH+-httpauth=$HTTPAUTH}
  LOG=${LOG+-log=$LOG}
  LOG_LEVEL=${LOG_LEVEL+-log-level=$LOG_LEVEL}
  PROTO=${PROTO+-proto=$PROTO}
  SUBDOMAIN=${SUBDOMAIN+-subdomain=$SUBDOMAIN}
  OPTIONS="AUTHTOKEN CONFIG HOSTNAME HTTPAUTH LOG LOG_LEVEL PROTO SUBDOMAIN"
  START=${START:-all}
  echo Current options: $OPTIONS
  echo Current start: $START
  ngrok $OPTIONS start $START
}

mode={MODE:-server}
if [ "$mode" == "server" ]; then
  echo Current mode: Server
  start_ngrokd
else if [ "$mode" == "client" ]; then
  echo Current mode: Client
  start_ngrok
else
  echo Error mode!
fi
