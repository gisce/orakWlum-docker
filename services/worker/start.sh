#!/bin/bash

# Load settings
PATHH=`dirname $0`
. $PATHH/../settings.sh

for worker in `seq $HOW_MANY_WORKERS`; do
    echo Starting $WORKER_container$worker
    name=`docker start $WORKER_container$worker`
done
