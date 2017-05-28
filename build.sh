#!/bin/bash

MONGO_26=2.6.12

MONGO_30=3.0.15

MONGO_32=3.2.13

MONGO_34=3.4.4

docker build --build-arg mongodb_version=${MONGO_26} -t scullxbones/mongodb:2.6 .

docker build --build-arg mongodb_version=${MONGO_30} -t scullxbones/mongodb:3.0 .

docker build --build-arg mongodb_version=${MONGO_32} -t scullxbones/mongodb:3.2 .

docker build --build-arg mongodb_version=${MONGO_34} -t scullxbones/mongodb:3.4 .

docker push scullxbones/mongodb:2.6

docker push scullxbones/mongodb:3.0

docker push scullxbones/mongodb:3.2

docker push scullxbones/mongodb:3.4
