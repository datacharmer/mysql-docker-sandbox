#!/bin/bash
cp Dockerfile.small Dockerfile
IMAGE=datacharmer/mysql-sb-gz
docker build  -t $IMAGE:latest .
if [ "$?" != "0" ] ; then exit 1 ; fi
cp Dockerfile.full Dockerfile
IMAGE=datacharmer/mysql-sb-full

cd dbdata
for D in ../dbdata-gz/*.gz
do
    tar -xzf $D
done
cd ..
docker build  -t $IMAGE:latest .

rm -rf dbdata/5*
