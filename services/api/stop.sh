#!/bin/bash

# Load settings
PATHH=`dirname $0`
. $PATHH/../settings.sh

name=`docker stop $API_container`
if [ "$name" == $API_container ]; then
    echo -e " --->\tStopped container '$name'"
else
    echo -e " --->\tCould not stop '$API_container'! Is it running?"
fi

name=`docker rm $API_container`
if [ "$name" == $API_container ]; then
    echo -e " --->\tRemoved container '$name'"
else
    echo -e " --->\tCould not remove '$API_container'! Does it exists?"
fi
