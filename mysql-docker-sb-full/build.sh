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
export SANDBOX_BINARY=$binaries
#echo $binaries
cd dbdata-gz
for TB in $( perl ../repo_list.pl)
do
    cp $binaries/$TB .
done
cd ..

cp Dockerfile.small Dockerfile
IMAGE=datacharmer/mysql-sb-gz
docker build  -t $IMAGE:latest .
if [ "$?" != "0" ] ; then exit 1 ; fi
cp Dockerfile.full Dockerfile
IMAGE=datacharmer/mysql-sb-full

cd dbdata
for TB in ../dbdata-gz/*.gz
do
    tar -xzf $TB
done
cd ..
docker build  -t $IMAGE:latest .

rm -rf dbdata/[58]*
rm -rf dbdata-gz/[58]*.gz
