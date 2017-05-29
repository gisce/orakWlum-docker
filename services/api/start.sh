#!/bin/bash

# Load settings
PATHH=`dirname $0`
. $PATHH/../settings.sh

name=`docker start $API_container`
if [ "$name" == $API_container ]; then
    echo -e " --->\tStarted container '$name'"
else
    echo -e " --->\tCould not start '$API_container'! It exist?"
fi
