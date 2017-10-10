#!/bin/sh
set -e

ENV=$1
APP_VERSION=$2

curl -X POST 'http://mockbin.org/echo' \
    -H 'Accept: application/json' \
    -H 'Content-Type: application/json' \
    -d @- <<END; 
{
   "inServiceStrategy":{
      "batchSize":1,
      "intervalMillis":2000,
      "startFirst":false,
      "launchConfig":{
         "instanceTriggeredStop":"stop",
         "kind":"container",
         "networkMode":"managed",
         "privileged":false,
         "publishAllPorts":false,
         "readOnly":false,
         "runInit":false,
         "startOnCreate":true,
         "stdinOpen":false,
         "tty":false,
         "vcpu":1,
         "type":"launchConfig",
         "blkioWeight":null,
         "capAdd":[

         ],
         "capDrop":[

         ],
         "cgroupParent":null,
         "count":null,
         "cpuCount":null,
         "cpuPercent":null,
         "cpuPeriod":null,
         "cpuQuota":null,
         "cpuRealtimePeriod":null,
         "cpuRealtimeRuntime":null,
         "cpuSet":null,
         "cpuSetMems":null,
         "cpuShares":null,
         "dataVolumes":[

         ],
         "dataVolumesFrom":[

         ],
         "description":null,
         "devices":[

         ],
         "diskQuota":null,
         "dns":[

         ],
         "dnsSearch":[

         ],
         "domainName":null,
         "environment":{
            "MULE_ENV":"$ENV",
            "NEXUS_SERVER":"artifacts.infra.doradosystems.com",
            "RELEASE_NUM":"$APP_VERSION"
         },
         "expose":[
            "8081",
            "8083"
         ],
         "healthCheck":{
            "strategy":"none",
            "type":"instanceHealthCheck",
            "healthyThreshold":2,
            "initializingTimeout":180000,
            "interval":2000,
            "name":null,
            "port":8081,
            "reinitializingTimeout":180000,
            "requestLine":"GET \"/callback-service/v1/healthcheck\" \"HTTP/1.1\\r\\nHost: services-tst.doradosystems.com\"",
            "responseTimeout":2000,
            "unhealthyThreshold":3
         },
         "healthInterval":null,
         "healthRetries":null,
         "healthTimeout":null,
         "hostname":null,
         "imageUuid":"docker:dorado/callback-service:1.0.0",
         "ioMaximumBandwidth":null,
         "ioMaximumIOps":null,
         "ip":null,
         "ip6":null,
         "ipcMode":null,
         "isolation":null,
         "kernelMemory":null,
         "labels":{
            "io.rancher.container.pull_image":"always"
         },
         "logConfig":{
            "type":"logConfig",
            "config":{

            },
            "driver":null
         },
         "memory":null,
         "memoryMb":null,
         "memoryReservation":null,
         "memorySwap":null,
         "memorySwappiness":null,
         "milliCpuReservation":null,
         "oomScoreAdj":null,
         "pidMode":null,
         "pidsLimit":null,
         "ports":[

         ],
         "requestedIpAddress":null,
         "secrets":[

         ],
         "shmSize":null,
         "stopSignal":null,
         "stopTimeout":null,
         "system":false,
         "user":null,
         "userdata":null,
         "usernsMode":null,
         "uts":null,
         "version":"2f996184-8c45-47b0-a361-4333a25dced2",
         "volumeDriver":null,
         "workingDir":null,
         "dataVolumesFromLaunchConfigs":[

         ],
         "networkLaunchConfig":null,
         "createIndex":null,
         "created":null,
         "deploymentUnitUuid":null,
         "externalId":null,
         "firstRunning":null,
         "healthState":null,
         "removed":null,
         "startCount":null,
         "uuid":null
      },
      "secondaryLaunchConfigs":[

      ]
   }
}