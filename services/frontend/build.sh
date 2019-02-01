#!/bin/bash

#PATHH=`dirname $0`

PATHH=~/src/*front*

if [[ $# -gt 0 ]]
then
  docker build -t okw/frontend:$1 --build-arg ORAKWLUM_FRONTEND_VERSION=$1 $PATHH
else
  docker build -t okw/frontend:latest $PATHH
fi
