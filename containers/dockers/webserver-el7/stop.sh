#!/bin/bash

#!/bin/bash

#/bin/bash

action=$1

export DOCKER_NET=eyeota-net
export DOCKER_IMAGE_NAME="traqy/eyeota-webserver"

export PROJECT_FULLPATH=`pwd`

old="$IFS"
IFS='
'


for container_info in $(<containers_list.txt);
do
   (
    IFS="$old"
    #echo $container_info
   
    c_name=`echo $container_info | awk '{print $1}'`
    c_ip=`echo $container_info | awk '{print $2}'`
    c_host_ssh_port=`echo $container_info | awk '{print $3}'`
    c_volume=`echo $container_info | awk '{print $4}'`

    echo "docker stop $c_name"
    docker stop $c_name    
    docker ps -a | grep "${c_name}" | awk '{print $1}' | xargs docker rm

    )
done