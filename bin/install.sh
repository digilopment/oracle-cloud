#!/bin/sh

#load env
cd ../
. ./.env

#check versions
echo "${SUDO_PASSWORD}" | docker-compose -v
echo "${SUDO_PASSWORD}" | docker -v

#set folders
rm -rf temp
rm -rf sqldeveloper
rm -rf images
mkdir temp images

#install oracle databse
git clone https://github.com/oracle/docker-images.git ./images
cd images/OracleDatabase/SingleInstance/dockerfiles
echo "${SUDO_PASSWORD}" | sudo -S bash ./buildContainerImage.sh -x -v ${VERSION} -o '--build-arg SLIMMING=false'
cd ../../../../

#install sql developer
cd temp
wget https://sys.markiza.io/sqldeveloper-22.2.1.234.1810-no-jre.zip
unzip sqldeveloper-22.2.1.234.1810-no-jre.zip -d ./
mv ./sqldeveloper ../sqldeveloper
cd ../
rm -rf temp

#run docker
echo "${SUDO_PASSWORD}" | sudo docker rm -f $(sudo docker ps -a -q --filter="ancestor=oracle/database:${VERSION}-xe")
echo "${SUDO_PASSWORD}" | echo "${SUDO_PASSWORD}" | 
#echo "${SUDO_PASSWORD}" | sudo -S docker run --name oracle-cloud -e ENABLE_TCPS=${ENABLE_TCPS} -v mydata:/opt/oracle/oradata oracle/database:${VERSION}-xe
