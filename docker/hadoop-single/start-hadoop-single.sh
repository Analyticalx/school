#!/bin/bash

# start ssh server
/etc/init.d/ssh start

# start hadoop
$HADOOP_HOME/sbin/start-dfs.sh
$HADOOP_HOME/sbin/start-yarn.sh
$HADOOP_HOME/sbin/mr-jobhistory-daemon.sh start historyserver

# keep container running
tail -f /dev/null
