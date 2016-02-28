#!/bin/bash
datadir=$(dirname $0)

for ARCHIVE in $(ls $datadir/*.gz ) 
do
    echo "# expanding $(basename $ARCHIVE)"
    tar -xzf $ARCHIVE && rm -f $ARCHIVE
done
