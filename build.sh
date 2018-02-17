#!/usr/bin/env bash

VERSION=$1
RELEASE=$2
IS_CURRENT=$3

docker build --build-arg mongodb_version=${RELEASE} -t scullxbones/mongodb:${VERSION} .
if [ "$IS_CURRENT" = "true" ]; then
    docker tag scullxbones/mongodb:${VERSION} scullxbones/mongodb:latest
fi
