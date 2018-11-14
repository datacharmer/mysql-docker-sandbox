#!/bin/bash
datadir=$(dirname $0)

for ARCHIVE in $(ls $datadir/*.xz ) 
do
    echo "# expanding $(basename $ARCHIVE)"
    tar -xf $ARCHIVE && rm -f $ARCHIVE
done
