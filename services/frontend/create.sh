#!/bin/bash
# Set Server Name


tag="latest"
if [ "$#" -ge 1 ]; then
    server_name="okW-frontend"
    tag="$1"
    if [ "$#" -ge 2 ]; then
        server_name="$2"
    fi
fi

# Load settings
PATHH=`dirname $0`
. $PATHH/../settings.sh

# Prepare socket and logs path
mkdir -p $socket_path
mkdir -p $frontend_logs_destination
chmod -R 777 $socket_path

container_id=`docker run --restart=always $frontend_ports_mapping --name $frontend_container -d $sockets $frontend_logs -i $frontend_image:$tag /run_frontend.sh $server_name`

if [ "$container_id" != "" ]
then
    echo "$container_id" > $frontend_pid
    echo "Container $container created! id: $container_id"
else
    if [ -e "id_frontend" ]; then
        rm $frontend_pid
    fi
    echo "[Error] $frontend_container can't be created!"
fi
