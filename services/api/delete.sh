#!/bin/bash

# Load settings
PATHH=`dirname $0`
. $PATHH/../settings.sh

name=`docker rm $API_container -f`
if [ "$name" == $API_container ]; then
    echo -e " --->\tRemoved container '$name'"
else
    echo -e " --->\tCould not remove '$API_container'! Does it exists?"
fi
