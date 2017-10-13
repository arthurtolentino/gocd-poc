#!/bin/sh
set -e

echo "rancher = $RANCHER_HOST"
echo "service id = $SERVICE_ID"

retry=0
while true; do
  echo 'waiting for upgrade to complete...'
  response=$(curl \
  -u "$RANCHER_API_USERNAME:$RANCHER_API_PASSWORD" \
  -X GET "$RANCHER_HOST/v2-beta/projects/1a11/services/$SERVICE_ID")

  `# extract and query by state field. rancher api filter does not work at service level`
  serviceState=$(expr "$response" : '.*"state":"\([^"]*\)"')
  if [ "$serviceState" = "upgraded" ];
    then
      echo 'performing finishupgrade...'
      response=$(curl \
      -u "$RANCHER_API_USERNAME:$RANCHER_API_PASSWORD" \
      -X POST "$RANCHER_HOST/v2-beta/projects/1a11/services/$SERVICE_ID/?action=finishupgrade")
      break
  fi

  retry=$(expr $retry + 1)
  if [ $retry -eq $POLL_DEPLOY_MAX_RETRY ]; then
    $(rollback)
  else
    echo "sleeping for $WAIT_INTERVAL_SECONDS s"
    sleep $WAIT_INTERVAL_SECONDS
  fi
done