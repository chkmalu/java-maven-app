#!/bin/sh
sudo yum upgrade -y && sudo yum install docker -y
sudo systemctl start docker.service
sudo usermod -aG docker ec2-user
wget https://github.com/docker/compose/releases/download/v2.16.0/docker-compose-linux-x86_64
mv docker-compose-linux-x86_64 /usr/local/bin/docker-compose