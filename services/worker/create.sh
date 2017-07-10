#!/bin/bash

PATHH=`dirname $0`
. $PATHH/../settings.sh

tag="latest"
if [ "$#" -ge 1 ]; then
    tag="$1"
fi

# Prepare sockets and logs path
mkdir -p $socket_path
mkdir -p $WORKER_logs_destination

container_id=`docker run --restart=always --network=host $WORKER_logs --name $WORKER_container -i $WORKER_image:$tag`

if [ "$container_id" != "" ]
then
    chmod -R 777 $socket_path
    echo "$container_id" > $WORKER_pid
    echo "$WORKER_container started! id: "$container_id
else
    if [ -e "id_frontend" ]; then
        rm $WORKER_pid
    fi
    echo "[Error] $WORKER_container can't be started!"
fi

