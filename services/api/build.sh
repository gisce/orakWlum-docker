#!/bin/bash

cp ~/.ssh/id_rsa* ./ssh/

PATHH=`dirname $0`

if [[ $# -gt 0 ]]
then
  docker build -t okw/api:$1 --build-arg ORAKWLUM_API_VERSION=$1 $PATHH
else
  docker build -t okw/api:latest $PATHH
fi

