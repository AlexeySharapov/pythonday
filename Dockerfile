FROM ubuntu:latest


#OS Update
RUN apt-get update
RUN apt-get -y install git git-core unzip python-pip make wget build-essential python-dev libpcre3 libpcre3-dev libssl-dev vim nano net-tools iputils-ping supervisor curl supervisor

WORKDIR /home/wipro
#Mongo Setup
RUN curl -O http://downloads.mongodb.org/linux/mongodb-linux-x86_64-3.0.2.tgz && tar -xzvf mongodb-linux-x86_64-3.0.2.tgz && cd mongodb-linux-x86_64-3.0.2/bin && cp * /usr/bin/
#RUN mongod --dbpath /home/azureuser/CI_service/data/ --logpath /home/azureuser/CI_service/log.txt --logappend --noprealloc --smallfiles --port 27017 --fork

#Node Setup
#RUN curl -O https://nodejs.org/dist/v0.12.7/node-v0.12.7.tar.gz && tar -xzvf node-v0.12.7.tar.gz && cd node-v0.12.7
#RUN cd /opt/node-v0.12.7 && ./configure && make && make install
#RUN cp /usr/local/bin/node /usr/bin/ && cp /usr/local/bin/npm /usr/bin/
RUN wget https://nodejs.org/dist/v0.12.7/node-v0.12.7-linux-x64.tar.gz
RUN cd /usr/local && sudo tar --strip-components 1 -xzf /home/wipro/node-v0.12.7-linux-x64.tar.gz
RUN npm install forever -g

#CI SERVICE
ADD prod /home//
ADD servicestart.sh /home/
RUN chmod +x /home/servicestart.sh
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
CMD ["sh", "/home/servicestart.sh"]

EXPOSE 80
EXPOSE 27017
