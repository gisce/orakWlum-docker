#!/bin/bash

PATHH=`dirname $0`

$PATHH/build_new_version.sh $*

$PATHH/change_version.sh $*

