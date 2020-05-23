#!/bin/bash

/opt/zeppelin-0.8.2-bin-all/bin/zeppelin-daemon.sh start

# keep container running
tail -f /dev/null