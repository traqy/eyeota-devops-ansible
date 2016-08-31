#!/bin/bash

DOCKER_IMAGE_NAME="traqy/centos7-systemd"
docker build --rm -t=$DOCKER_IMAGE_NAME .
