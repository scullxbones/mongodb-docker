FROM debian:jessie
MAINTAINER Brian Scully <scullduggery@gmail.com>
ARG mongodb_version=3.2.0

RUN apt-key adv --keyserver keyserver.ubuntu.com --recv 7F0CEB10 &&\
    apt-key adv --keyserver hkp://keyserver.ubuntu.com --recv EA312927 &&\
    echo 'deb http://downloads-distro.mongodb.org/repo/debian-sysvinit dist 10gen' |\
      tee /etc/apt/sources.list.d/mongodb.list &&\
    echo "deb http://repo.mongodb.org/apt/debian wheezy/mongodb-org/3.0 main" | \
      tee /etc/apt/sources.list.d/mongodb-org-3.0.list &&\
    echo "deb http://repo.mongodb.org/apt/debian wheezy/mongodb-org/3.2 main" | \
      tee /etc/apt/sources.list.d/mongodb-org-3.2.list &&\
    apt-get update &&\
    apt-get upgrade

RUN apt-get install -y \
      mongodb-org=${mongodb_version} \
      mongodb-org-server=${mongodb_version} \
      mongodb-org-shell=${mongodb_version} \
      mongodb-org-mongos=${mongodb_version} \
      mongodb-org-tools=${mongodb_version} &&\
    apt-get clean &&\
    rm -rf /var/lib/apt/lists/*

VOLUME ["/data/db"]

WORKDIR /data

ENTRYPOINT ["mongod"]

CMD ["--help"]

EXPOSE 27017
