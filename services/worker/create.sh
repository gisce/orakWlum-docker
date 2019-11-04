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

for worker in `seq $HOW_MANY_WORKERS`; do
    echo Creating $WORKER_container$worker
    docker run --restart=always --network=host $WORKER_logs --name $WORKER_container$worker -i $WORKER_image:$tag &
done

chmod -R 777 $socket_path
echo "$container_id" > $WORKER_pid
echo "$WORKER_container started! id: "$container_id

