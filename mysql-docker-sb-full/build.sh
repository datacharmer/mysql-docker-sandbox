#!/bin/bash
cd $(dirname $0)
curpath=$PWD
binaries=../../mysql-docker-minimal/dbdata
if [ ! -d $binaries ]
then
    echo "$binaries not found"
    exit 1
fi
cd $binaries
binaries=$PWD
export SANDBOX_BINARY=$binaries
cd $curpath

function build
{
    template=$1
    image=$2
    cp Dockerfile.$template Dockerfile
    if [ "$?" != "0" ] ; then exit 1 ; fi
    docker build  -t $image:latest .
    if [ "$?" != "0" ] ; then exit 1 ; fi
    rm -f Dockerfile
}

# GZ
function build_gz
{
    for TB in $( perl repo_list.pl)
    do
        cp -v $binaries/$TB dbdata
    done
    build small datacharmer/mysql-sb-gz
    rm -f dbdata-gz/[85]*
}

function prepare_full
{
    cd dbdata
    for TB in $( perl ../repo_list.pl)
    do
        target=$(basename $TB .tar.gz)
        if [ ! -d $target ]
        then
            echo "tar -xzf $TB "
            tar -xzf $binaries/$TB
        fi
    done
    cd ..
}

# FULL
function build_full
{
    prepare_full
    build full datacharmer/mysql-sb-full
}

# THIN
function build_thin
{
    prepare_full
    build thin datacharmer/mysql-sb-thin
}

target=$1
if [ -z "$target" ]
then
    echo "Target required (full|thin|gz)"
    exit 1
fi
case $target in
    full)
        build_full
        ;;
    thin)
        build_thin
        ;;
    gz)
        build_gz
        ;;
    *)
        echo unrecognized target $target
        exit 1
        ;;
esac

rm -rf dbdata/[85]*
