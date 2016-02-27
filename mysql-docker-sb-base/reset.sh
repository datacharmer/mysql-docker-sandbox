#!/bin/bash
RUNNING_CONTAINERS=$(docker ps -aq)
if [ -n "$RUNNING_CONTAINERS" ]
then
    for CONTAINER in $RUNNING_CONTAINERS
    do
        docker rm -v -f $CONTAINER
    done
fi

TARGET=datacharmer/mysql-sb-base
BUILT_IMAGE=$(docker images | grep $TARGET)
if [ -n "$BUILT_IMAGE" ]
then
    docker rmi $TARGET
fi

# docker rmi datacharmer/mysql-docker-small-sandbox
ORPHAN_IMAGES=$(docker images | grep '<none>' | awk '{print $3}' )
if [ -n "$ORPHAN_IMAGES" ]
then
    for IMAGE in $ORPHAN_IMAGES
    do
        docker rmi $IMAGE
    done
fi
