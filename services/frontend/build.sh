#!/bin/bash

if [[ $# -gt 0 ]]
then
  docker build -t okw/frontend:$1 --build-arg ORAKWLUM_FRONTEND_VERSION=$1 .
else
  docker build -t okw/frontend:latest .
fi
