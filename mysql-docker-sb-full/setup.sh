#!/bin/bash

if [ -L /home/msandbox/opt/mysql ]
then
  rm /home/msandbox/opt/mysql
fi
mkdir /home/msandbox/opt/mysql
cd /home/msandbox/opt/mysql
sudo /opt/mysql/expand.sh
