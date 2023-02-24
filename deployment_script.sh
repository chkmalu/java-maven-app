#!/bin/bash
export DOCKER_USER=$1
export DOCKER_PASS=$2
echo $DOCKER_PASS | docker login -u $DOCKER_USER --password-stdin 
docker-compose -f compose.yaml up