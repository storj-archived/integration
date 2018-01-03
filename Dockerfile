FROM ubuntu:16.04
RUN rm /bin/sh && ln -s /bin/bash /bin/sh
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927
RUN echo "deb http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.2 multiverse" | tee /etc/apt/sources.list.d/mongodb-org-3.2.list
RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y mongodb-org rabbitmq-server redis-server build-essential wget git python libkrb5-dev vim emacs
ADD https://raw.githubusercontent.com/mongodb/mongo/v3.2/debian/init.d /etc/init.d/mongod
RUN chmod +x /etc/init.d/mongod
WORKDIR /root
RUN wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.32.1/install.sh | bash
RUN source /root/.nvm/nvm.sh; \
    nvm install v6; \
    nvm alias default v6; \
    nvm use default; \
    npm install pm2 -g;
COPY package.json /root/package.json
COPY config /root/config
COPY scripts /root/scripts
COPY bin /root/bin
RUN source /root/.nvm/nvm.sh; \
    cd /root; \
    npm install;
EXPOSE 8080
EXPOSE 9001
EXPOSE 9002
EXPOSE 9003
EXPOSE 9004
EXPOSE 9005
EXPOSE 9006
EXPOSE 9007
EXPOSE 9008
EXPOSE 9009
EXPOSE 9010
EXPOSE 9011
EXPOSE 9012
EXPOSE 9013
EXPOSE 9014
EXPOSE 9015
EXPOSE 9016
RUN echo "export STORJ_BRIDGE=\"http://localhost:6382\"" >> /root/.bashrc
RUN echo "export STORJ_ALLOW_LOOPBACK=\"true\"" >> /root/.bashrc
