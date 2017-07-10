#!/bin/bash

PATHH=`dirname $0`

if [[ $# -gt 0 ]]
then
  docker build -t okw/worker:$1 --build-arg ORAKWLUM_API_VERSION=$1 $PATHH
else
  docker build -t okw/worker:latest $PATHH --build-arg ORAKWLUM_API_VERSION=latest $PATHH
fi

