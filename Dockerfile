FROM registry.ecare.csolab.ru/ubuntu:16.04
MAINTAINER aleksei.sharapov@t-systems.com

ARG http_proxy=http://proxy.t-systems.ru:3128
ARG https_proxy=http://proxy.t-systems.ru:3128
ARG no_proxy=ecare.devlab.de.tmo
ARG HTTP_PROXY=http://proxy.t-systems.ru:3128
ARG HTTPS_PROXY=http://proxy.t-systems.ru:3128
ARG NO_PROXY=ecare.devlab.de.tmo
ARG MAVEN_REPOSITORY=http://10.233.53.30:8081/nexus/content/groups/public

RUN apt-get -y update && apt-get -y install git python3 python3-pip && apt-get install -y openjdk-7-jdk
RUN pip3 install flask

RUN mkdir -p /appl
RUN mkdir -p /appl/templates
ADD app/cli /cli
ADD ./app.py /appl
ADD ./templates /appl/templates
