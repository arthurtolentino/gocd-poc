#!/bin/sh
set -e

echo 'performing upgrade...'

status=$(curl --write-out %{http_code} --silent --output \
/dev/null -u "$RANCHER_API_USERNAME:$RANCHER_API_PASSWORD" \
-X POST "$RANCHER_HOST/v2-beta/projects/1a11/services/$SERVICE_ID/?action=upgrade" \
-H 'Accept: application/json' \
-H 'Content-Type: application/json' \
--data-binary '@upgrade-callback-service.json')

echo "status code: $status"

if [ $status -ne 202 ]; then
	exit 1
fi