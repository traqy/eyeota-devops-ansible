#!/bin/bash

DOCKER_IMAGE_NAME="traqy/eyeota-webserver-centos7"
docker build -t=$DOCKER_IMAGE_NAME .