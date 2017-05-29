#!/bin/bash

### Start development mode

if [ "$#" -ne 1 ]; then
    echo "Provide development path"
    exit
else
    development_path=$1
fi




PATHH=`dirname $0`
. $PATHH/settings.sh

# Preventive stop
bash $PATHH/stop.sh

# Clean'up TMP_PATH
rm -fR $TMP_PATH
mkdir -p $TMP_PATH
container_id=`docker run --network=host -d -v $TMP_PATH:/tmp/ -v $development_path:/tmp/devel --name $container -i $image`

if [ "$container_id" != "" ]
then
    echo "$container_id" > $container_id_file
    echo "Container started! id: "$container_id
else
    if [ -e "id_frontend" ]; then
        rm $container_id_file
    fi
    echo "[Error] $container can't be started!"
fi
