#!/bin/bash

#/bin/bash

action=$1

export DOCKER_NET=eyeota-net
export DOCKER_IMAGE_NAME="traqy/eyeota-webserver-centos7"

export DOCKER_PROJECT_FULLPATH=`pwd`

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

    volume_path=${DOCKER_PROJECT_FULLPATH}/$c_volume
    
    docker ps -a | grep "${c_name}" | awk '{print $1}' | xargs docker rm

    echo "Container Name: $c_name"
    echo "IP: $c_ip"
    echo "Port: $c_host_ssh_port"
    echo "volume: $c_volume"



    if [ "$action" = "ansible" ]; then

        echo "Run based on ansible"

       docker run --privileged -d --restart always \
       --net $DOCKER_NET \
       --ip $c_ip \
       -p "${docker_machine_ip}:${c_host_ssh_port}":22 -it \
       -e "container=docker"  \
       -v /sys/fs/cgroup:/sys/fs/cgroup  \
       -v "${DOCKER_PROJECT_FULLPATH}":/root \
       --name=$c_name \
       "docker.io/ansible/centos7-ansible" /usr/sbin/init

       #docker exec $c_name /root/docker-entrypoint.sh
       docker exec $c_name yum install -y openssh-server telnet net-tools
       docker exec $c_name systemctl enable sshd
       docker exec $c_name systemctl start sshd

    else

        echo "Run based on my Image "
        docker run -d --restart always \
        --net $DOCKER_NET \
        --ip $c_ip \
        -p "${docker_machine_ip}:${c_host_ssh_port}":22 \
        -e "container=docker" \
        -v /sys/fs/cgroup:/sys/fs/cgroup \
        -v "$volume_path":/media/ephemeral \
        -h ${c_name} \
        --name=${c_name} \
        ${DOCKER_IMAGE_NAME} /usr/sbin/init
    fi


   )
done