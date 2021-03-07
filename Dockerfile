FROM ubuntu:20.04
MAINTAINER haniokasai <htek@haniokasai.com>


ENV DEBIAN_FRONTEND=noninteractive
ENV DATAPATH=/data/

# RUN: when image is being built
#apt srv https://qiita.com/fkshom/items/53de3a9b9278cd524099
RUN sed -i.bak -e "s%http://[^ ]\+%http://ftp.jaist.ac.jp/pub/Linux/ubuntu/%g" /etc/apt/sources.list
RUN apt update

#curl for libcurl4 for bds
RUN apt install zip rsync unzip expect perl curl -y

#Make necessary dirs
RUN mkdir -p  ${DATAPATH} /resources/

##Initial flag
RUN touch /data/initialstart

#Copy
COPY ./resources/*  /resources/

#Minecraft and FTP
WORKDIR /resources/
ENTRYPOINT sh /resources/run-Main.sh
