#!/bin/bash

# Load settings
PATHH=`dirname $0`
. $PATHH/../settings.sh

for worker in `seq $HOW_MANY_WORKERS`; do
    echo Deleting $WORKER_container$worker
    name=`docker rm $WORKER_container$worker -f`
done
