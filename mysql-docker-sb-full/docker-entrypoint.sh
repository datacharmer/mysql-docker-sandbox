#!/bin/bash

sudo chown -R msandbox.msandbox /opt/mysql

exec "$@"
