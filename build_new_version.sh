#!/bin/bash

if [ "$#" -ge 1 ]; then
    service="$1"
    tag="master"
   
    # Validate service
    if [ "$service" != "api" ] && [ "$service" != "frontend" ] && [ "$service" != "worker" ] ; then
        echo "Service must be 'frontend', 'api' or 'worker'"
        exit
    fi

    # Fetch tag / branch to deploy
    if [ "$#" -ge 2 ]; then
        tag="$2"
    fi
else
    echo "Service must be provided as 1st argument"
    exit
fi

PATHH=`dirname $0`

echo "Building $tag"
$PATHH"/services/"$service"/build.sh" $tag 

docker tag okw/$service:$tag okw/$service:latest