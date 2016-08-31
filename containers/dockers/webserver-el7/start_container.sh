for container_info in $(<containers_list.txt);
do
   (
   IFS="$old"
   echo $container_info
   
    c_name=`echo $container_info | awk '{print $1}'`
    c_ip=`echo $container_info | awk '{print $2}'`
    c_host_ssh_port=`echo $container_info | awk '{print $3}'`
    c_volume=`echo $container_info | awk '{print $4}'`

    docker start ${c_name}
   )
done    