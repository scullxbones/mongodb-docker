#!/usr/bin/env bash

VERSION=$1
RELEASE=$2
IS_CURRENT=$3

docker build --build-arg mongodb_version=${RELEASE} -t scullxbones/mongodb:${VERSION} .

if [ "$IS_CURRENT" = "true" ]; then
  docker tag scullxbones/mongodb:${VERSION} scullxbones/mongodb:latest
fi
if [ "$TRAVIS_BRANCH" == "master" ]; then
  docker login -u $DOCKER_USERNAME -p $DOCKER_PASSWORD
  docker push scullxbones/mongodb:$MONGODB_VERSION
  if [ "$IS_CURRENT" = "true" ]; then
    docker push scullxbones/mongodb:latest
  fi
fi
