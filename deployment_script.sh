#!/bin/bash
export DOCKER_USER=$1
export DOCKER_PASS=$2
echo $DOCKER_PASS | docker loging -u $DOCKER_USER --pass-stdin 
docker-compose -f compose.yaml up