#!/bin/bash

/etc/init.d/ssh restart

while true;
do
h=`hostname`
echo "I am web server: $h"
sleep 10
done