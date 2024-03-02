#!/bin/sh

if [ -z "$API_URL" ]; then
  echo "API_URL environment variable is not set. Exiting."
  exit 1
fi

if [ -z "$WS_URL" ]; then
  echo "WS_URL environment variable is not set. Exiting."
  exit 1
fi

echo "API_URL: $API_URL"
echo "WS_URL: $WS_URL"

envsubst '${API_URL},${WS_URL}' < /etc/nginx/conf.d/default.conf.template > /etc/nginx/conf.d/default.conf
exec nginx -g 'daemon off;'
