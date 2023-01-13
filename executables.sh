#!/bin/bash

export IMAGETAG=$1 

docker-compose -f composefile.yml up --detach