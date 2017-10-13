#!/bin/sh
set -e

USERNAME=$1
PASSWORD=$2

echo 'performing upgrade...'

status=$(curl --write-out %{http_code} --silent --output \
/dev/null -u "$RANCHER_API_USERNAME:$RANCHER_API_PASSWORD" \
-X POST 'https://rancher.doradosystems.com:8443/v2-beta/projects/1a11/services/1s424/?action=upgrade' \
-H 'Accept: application/json' \
-H 'Content-Type: application/json' \
--data-binary '@upgrade-callback-service.json')

echo "http status: $status"

if [ $status -ne 202 ]; then
	exit 1
fi