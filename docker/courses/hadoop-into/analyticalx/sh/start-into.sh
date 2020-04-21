#!/bin/bash

# start check server
nohup python3 -u /analyticalx/web/check.py > /analyticalx/web/check.out &

sh /start-hadoop.sh
#tail -f /dev/null