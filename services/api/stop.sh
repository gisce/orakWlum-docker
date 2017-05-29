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
