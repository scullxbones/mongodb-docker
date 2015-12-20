#!/bin/bash

MONGO_26=2.6.11

MONGO_30=3.0.8

MONGO_32=3.2.0

docker build --build-arg mongodb_version=${MONGO_26} -t scullxbones/mongodb:2.6 .

docker build --build-arg mongodb_version=${MONGO_30} -t scullxbones/mongodb:3.0 .

docker build --build-arg mongodb_version=${MONGO_32} -t scullxbones/mongodb:3.2 .

docker push scullxbones/mongodb:2.6

docker push scullxbones/mongodb:3.0

docker push scullxbones/mongodb:3.2
