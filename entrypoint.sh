#!/usr/bin/env sh
set -e


if [ -n "$HEADER" ]; then
  echo $HEADER > /opt/headerfile
  HEADER="-H @/opt/headerfile"
fi
if [ -n "$DATA" ]; then
  eval echo $DATA > /opt/datafile
  DATA="-d @/opt/datafile"
fi
if [ -n "$METHOD" ]; then
  METHOD="-X $METHOD"
fi

echo "URL: $URL"
echo "Method: $METHOD"
echo "Interval: $INTERVAL"
echo "Header: $HEADER"
echo "Data: $DATA"

if [ -n "$URL" ]; then
  while true; do
    echo -e "$(date '+%Y-%m-%d %H:%M:%S') [INFO] Invoking cURL..."
    curl $DATA \
         $METHOD \
         --url $URL \
         $HEADER \
         $EXTRA_OPTS \
         --fail --silent --show-error
    sleep $INTERVAL
    echo -e "\n"
  done
else
  echo -e "$(date '+%Y-%m-%d %H:%M:%S') [ERROR] URL not defined. Please check if all environment variables are set."
  exit 1
fi

