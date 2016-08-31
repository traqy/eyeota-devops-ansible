#!/bin/bash

#/bin/bash

action=$1

export DOCKER_NET=eyeota-net
export DOCKER_IMAGE_NAME="traqy/eyeota-webserver"
export DOCKER_CONTAINER_NAME="eyeota-webserver1"

export PROJECT_FULLPATH=`pwd`

docker_machine_ip=`docker-machine ip`


old="$IFS"
IFS='
'

for container_info in $(<containers_list.txt);
do
   (
   IFS="$old"
   echo $container_info
   
    c_name=`echo $container_info | awk '{print $1}'`
    c_ip=`echo $container_info | awk '{print $2}'`
    c_host_ssh_port=`echo $container_info | awk '{print $3}'`
    c_volume=`echo $container_info | awk '{print $4}'`

    volume_path=${PROJECT_FULLPATH}/$c_volume
    
    docker ps -a | grep "${c_name}" | awk '{print $1}' | xargs docker rm

    echo "Container Name: $c_name"
    echo "IP: $c_ip"
    echo "Port: $c_host_ssh_port"
    echo "volume: $c_volume"

    docker run -d --net $DOCKER_NET \
    -h ${c_name} \
    --ip $c_ip \
    -v "$volume_path":/media/ephemeral \
    --name=${c_name} \
    -p "${docker_machine_ip}:${c_host_ssh_port}":22 \
    --privileged ${DOCKER_IMAGE_NAME} /bin/bash
    )
done

