#!/bin/bash

# Load settings
PATHH=`dirname $0`
. $PATHH/../settings.sh

name=`docker start $frontend_container`
if [ "$name" == $frontend_container ]; then
    echo -e " --->\tStarted container '$name'"
else
    echo -e " --->\tCould not start '$frontend_container'! Is exist?"
fi

