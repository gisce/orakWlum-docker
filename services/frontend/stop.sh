#!/bin/bash

# Load settings
PATHH=`dirname $0`
. $PATHH/../settings.sh

name=`docker stop $frontend_container`
if [ "$name" == $frontend_container ]; then
    echo -e " --->\tStopped container '$name'"
else
    echo -e " --->\tCould not stop '$frontend_container'! Is it running?"
fi

