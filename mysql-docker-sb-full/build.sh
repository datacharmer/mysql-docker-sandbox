#!/bin/bash
cp Dockerfile.small Dockerfile
docker build -t datacharmer/mysql-sb-gz .
if [ "$?" != "0" ] ; then exit 1 ; fi
cp Dockerfile.full Dockerfile
docker build -t datacharmer/mysql-sb-full  .
