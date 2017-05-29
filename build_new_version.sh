#!/bin/bash

if [ "$#" -ge 1 ]; then
    service="$1"
    tag="master"
   
    # Validate service
    if [ "$service" != "api" ] && [ "$service" != "frontend" ] ; then
        echo "Service must be 'frontend' or 'api'"
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

$PATHH"/services/"$service"/build.sh" $tag 
