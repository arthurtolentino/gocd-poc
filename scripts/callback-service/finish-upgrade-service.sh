#!/bin/sh
set -e

retry=0
max_retry=5
while true; do
  echo 'waiting for upgrade to compelte...'
  response=$(curl \
  -u "$RANCHER_API_USERNAME:$RANCHER_API_PASSWORD" \
  -X GET 'http://rancher.doradosystems.com:8080/v2-beta/projects/1a11/services/1s424')

  `# extract and query by state field. rancher api filter does not work at service level`
  serviceState=$(expr "$response" : '.*"state":"\([^"]*\)"')
  if [ "$serviceState" = "upgraded" ];
    then
      echo 'performing finishupgrade...'
      response=$(curl \
      -u "$RANCHER_API_USERNAME:$RANCHER_API_PASSWORD" \
      -X POST 'http://rancher.doradosystems.com:8080/v2-beta/projects/1a11/services/1s424/?action=finishupgrade')
      break
  fi

  retry=$(expr $retry + 1)
  if [ $retry -eq $max_retry ]; then
    $(rollback)
  else
    echo 'sleeping...'
    sleep 5
  fi
done