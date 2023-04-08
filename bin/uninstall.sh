#!/bin/sh

#load env
cd ../
. ./.env

sudo docker stop $(sudo docker ps -q)
sudo docker rmi -f $(sudo docker images | grep oracle-cloud | awk '{print $3}')
sudo docker rm -f $(sudo docker ps -a -q --filter="ancestor=oracle/database:$VERSION-xe")
sudo docker rmi oracle/database:21.3.0-xe

sudo docker rm oracle-cloud
sudo docker system prune

sudo rm -rf temp
sudo rm -rf images
sudo rm -rf images/oracle
sudo rm -rf volumes
sudo rm -rf sqldeveloper
sudo rm -rf ~/.sqldeveloper
