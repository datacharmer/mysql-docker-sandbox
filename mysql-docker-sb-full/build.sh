#!/bin/bash
cd $(dirname $0)
binaries=../../mysql-docker-minimal/dbdata
if [ ! -d $binaries ]
then
    echo "$binaries not found"
    exit 1
fi
cd $binaries
binaries=$PWD
cd -
#echo $binaries
cp Dockerfile.small Dockerfile
IMAGE=datacharmer/mysql-sb-gz
docker build  -t $IMAGE:latest .
if [ "$?" != "0" ] ; then exit 1 ; fi
cp Dockerfile.full Dockerfile
IMAGE=datacharmer/mysql-sb-full

cd dbdata
for D in $binaries/*.gz
do
    tar -xzf $D
done
cd ..
docker build  -t $IMAGE:latest .

rm -rf dbdata/[58]*
