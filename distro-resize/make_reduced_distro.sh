#!/bin/bash

OS=$(uname -s)
if [ "$OS" != "Linux" ]
then
    echo "# WARNING! This script was only tested on Linux"
    echo "# Press ENTER to continue AT YOUR OWN RISK"
    echo "# or press CTRL-C to abort"
    read
fi

distro=$1
if [ -z "$distro" ]
then
    echo "# syntax: $0 distro"
    exit 1
fi
files=$2
[ -z "$files" ] && files=files57.txt

if [ ! -d $distro ]
then
    echo "# Distro '$distro' not found in $PWD"
    exit 1
fi

NOT_FOUND=
for F in $(cat $files)
do
    if [ -f $distro/$F ]
    then
        echo "OK - $F"
    else
        echo "NOT FOUND: $F"
        NOT_FOUND=1
    fi
done
if [ -n "$NOT_FOUND" ]
then
    echo "# Some files were not found in $distro"
    exit 1
fi
#exit
if [ -e full_$distro ]
then
    echo "# full_$distro already exists"
    exit 1
fi

mv $distro full_$distro
mkdir $distro

for D in $(cat dirs.txt)
do
    mkdir -p $distro/$D
done

for F in $(cat $files)
do
    cp --preserve full_$distro/$F $distro/$F
done

mkdir $distro/lib
cp -r --preserve full_$distro/lib/* $distro/lib

du -sh $distro
cd $distro/bin
file * | grep -v script | awk '{print $1}' | tr -d ':' | xargs strip
cd -
cd $distro/lib
rm -rf ./*debug* 
if [ -d ./mecab ]
then
    rm -rf ./mecab
fi
for DD in $(find . -type d -name debug )
do
    rm -rf $DD
done

file * |grep 'current\|shared' | awk '{print $1}' | tr -d ':' | xargs strip
cd -
du -sh $distro

