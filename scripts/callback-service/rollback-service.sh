#!/bin/sh
set -e

echo "rancher = $RANCHER_HOST"
echo "service id = $SERVICE_ID"
echo 'performing rollback...'

(curl -u "$RANCHER_API_USERNAME:$RANCHER_API_PASSWORD" \
-X POST "$RANCHER_HOST/v2-beta/projects/1a11/services/$SERVICE_ID/?action=rollback" \
--write-out %{http_code} --silent --output /dev/null | cat)