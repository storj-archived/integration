FROM ubuntu:16.04
RUN rm /bin/sh && ln -s /bin/bash /bin/sh
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927
RUN echo "deb http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.2 multiverse" | tee /etc/apt/sources.list.d/mongodb-org-3.2.list
RUN apt-get update
RUN apt-get install -y mongodb-org rabbitmq-server wget apt-transport-https build-essential ca-certificates git libssl-dev python libkrb5-dev
RUN groupadd storj
RUN useradd storj -m -s /bin/bash -g storj
ENV HOME /home/storj
USER storj
WORKDIR /home/storj
RUN wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.32.1/install.sh | bash
RUN source ~/.nvm/nvm.sh; \
    nvm install v4; \
    nvm alias default v4; \
    nvm use default;
COPY src/ /home/storj/
RUN source ~/.nvm/nvm.sh; \
    ./code/install.sh
