FROM ubuntu:latest


#OS Update
RUN apt-get update
RUN apt-get -y install git git-core unzip python-pip make wget build-essential python-dev libpcre3 libpcre3-dev libssl-dev vim nano net-tools iputils-ping supervisor curl supervisor

