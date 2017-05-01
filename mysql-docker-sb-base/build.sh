#!/bin/bash
cd $(dirname $0)
docker build -t datacharmer/mysql-sb-base .
