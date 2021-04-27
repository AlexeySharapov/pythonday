FROM ubuntu


RUN apt-get -y update && apt-get -y install git python3 python3-pip
RUN pip3 install flask

RUN ls
RUN mkdir -p /appl
RUN mkdir -p /appl/templates
ADD app/cli /cli
ADD ./app.py /appl
ADD ./templates /appl/templates
