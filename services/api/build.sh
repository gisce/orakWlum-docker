#!/bin/bash

cp ~/.ssh/id_rsa* ./ssh/
if [[ $# -gt 0 ]]
then
  docker build -t okw/api:$1 --build-arg ORAKWLUM_API_VERSION=$1 .
else
  docker build -t okw/api:latest .
fi

