#!/bin/sh
set -e

echo 'performing rollback...'

curl -u "$RANCHER_API_USERNAME:$RANCHER_API_PASSWORD" \
-X POST "$RANCHER_HOST/v2-beta/projects/1a11/services/$SERVICE_ID/?action=rollback" \
--write-out %{http_code} --silent --output /dev/null