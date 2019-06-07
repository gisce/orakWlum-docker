#!/bin/bash

PATHH=`dirname $0`
. $PATHH/../settings.sh

tag="latest"
if [ "$#" -ge 1 ]; then
    tag="$1"
fi

# Prepare sockets and logs path
mkdir -p $socket_path
mkdir -p $API_logs_destination

container_id=`docker run --restart=always --network=host -d $sockets $API_logs --name $API_container -i $API_image:$tag`

if [ "$container_id" != "" ]
then
    chmod -R 777 $socket_path
    echo "$container_id" > $API_pid
    echo "$API_container started! id: "$container_id
else
    if [ -e "id_frontend" ]; then
        rm $API_pid
    fi
    echo "[Error] $API_container can't be started!"
fi
