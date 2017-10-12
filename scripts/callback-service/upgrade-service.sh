#!/bin/sh
set -e

USERNAME=$1
PASSWORD=$2

echo 'performing upgrade...'
pwd
upgradeStatus=$(curl --write-out %{http_code} --silent --output /dev/null -u \"$USERNAME:$PASSWORD\" -X POST 'http://rancher.doradosystems.com:8080/v2-beta/projects/1a11/services/1s424/?action=upgrade' -H 'Accept: application/json' -H 'Content-Type: application/json' --data-binary '@gocd-poc/scripts/callback-service/upgrade-callback-service.json')
echo 'Rancher upgrade call status: $upgradeStatus'