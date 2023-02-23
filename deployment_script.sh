#!/bin/bash

docker loging -u $1 -p $2
docker-compose -f compose.yaml up