#!/bin/sh
git checkout .
git pull
chmod +x *

cd resources

rm -rf pmmp.phar
wget https://jenkins.pmmp.io/job/PocketMine-MP/lastSuccessfulBuild/artifact/PocketMine-MP.phar -O pmmp.phar

rm -rf bin
tar zxvf PHP*.tar.gz
rm -f  PHP*.tar.gz

docker build . -t mirm/docker-pmmp
docker push mirm/docker-pmmp:latest