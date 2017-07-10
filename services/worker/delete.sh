#!/bin/bash

# Load settings
PATHH=`dirname $0`
. $PATHH/../settings.sh

name=`docker rm $WORKER_container -f`
if [ "$name" == $WORKER_container ]; then
    echo -e " --->\tRemoved container '$name'"
else
    echo -e " --->\tCould not remove '$WORKER_container'! Does it exists?"
fi
