#!/bin/bash

# Load settings
PATHH=`dirname $0`
. $PATHH/../settings.sh

name=`docker start $WORKER_container`
if [ "$name" == $WORKER_container ]; then
    echo -e " --->\tStarted container '$name'"
else
    echo -e " --->\tCould not start '$WORKER_container'! It exist?"
fi
