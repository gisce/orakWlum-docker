#!/bin/bash

cp ~/.ssh/id_rsa* ./
if [[ $# -gt 0 ]]
then
  docker build -t orakwlum/api:$1 --build-arg ORAKWLUM_API_VERSION=$1 .
else
  docker build -t orakwlum/api:master .
fi

