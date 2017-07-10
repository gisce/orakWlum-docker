#!/bin/bash

# Load settings
PATHH=`dirname $0`
. $PATHH/../settings.sh

name=`docker stop $WORKER_container`
if [ "$name" == $WORKER_container ]; then
    echo -e " --->\tStopped container '$name'"
else
    echo -e " --->\tCould not stop '$WORKER_container'! Is it running?"
fi
