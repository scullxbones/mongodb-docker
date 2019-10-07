FROM debian:stretch-slim
MAINTAINER Brian Scully <scullduggery@gmail.com>
ARG mongodb_version=4.2.0

RUN apt-get update && apt-get install -y --install-recommends dirmngr gnupg wget ca-certificates libcurl3 openssl && \
    apt-key adv --keyserver keyserver.ubuntu.com --recv 7F0CEB10 && \
    apt-key adv --keyserver hkp://keyserver.ubuntu.com --recv EA312927 && \
    apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 0C49F3730359A14518585931BC711F9BA15703C6 && \
    apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 2930ADAE8CAF5059EE73BB4B58712A2291FA4AD5 && \
    wget -qO - https://www.mongodb.org/static/pgp/server-3.6.asc | apt-key add - && \
    wget -qO - https://www.mongodb.org/static/pgp/server-4.0.asc | apt-key add - && \
    wget -qO - https://www.mongodb.org/static/pgp/server-4.2.asc | apt-key add - && \
    echo "deb http://repo.mongodb.org/apt/debian jessie/mongodb-org/3.4 main" | \
      tee /etc/apt/sources.list.d/mongodb-org-3.4.list && \
    echo "deb http://repo.mongodb.org/apt/debian stretch/mongodb-org/3.6 main" | \
      tee /etc/apt/sources.list.d/mongodb-org-3.6.list && \
    echo "deb http://repo.mongodb.org/apt/debian stretch/mongodb-org/4.0 main" | \
      tee /etc/apt/sources.list.d/mongodb-org-4.0.list && \
    echo "deb http://repo.mongodb.org/apt/debian stretch/mongodb-org/4.2 main" | \
      tee /etc/apt/sources.list.d/mongodb-org-4.2.list && \
    apt-get update && \
    apt-get upgrade -y

RUN apt-get install -y \
      mongodb-org=${mongodb_version} \
      mongodb-org-server=${mongodb_version} \
      mongodb-org-shell=${mongodb_version} \
      mongodb-org-mongos=${mongodb_version} \
      mongodb-org-tools=${mongodb_version} && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

VOLUME ["/data/db"]

WORKDIR /data

ENTRYPOINT ["mongod"]

CMD ["--help"]

EXPOSE 27017
