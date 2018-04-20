#!/bin/bash
cd $(dirname $0)
cp $HOME/go/bin/dbdeployer .
if [ "$?" != "0" ] ; then exit ; fi
cp /etc/bash_completion.d/dbdeployer_completion.sh .
if [ "$?" != "0" ] ; then exit ; fi
docker build -t datacharmer/mysql-sb-base .
