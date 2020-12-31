#!/bin/bash

# start ssh server
/etc/init.d/ssh start

# format namenode
nnformat="/namenode-is-format"
if test -f "$nnformat"; then
    echo "HDFS is formatted"
else
    $HADOOP_HOME/bin/hdfs namenode -format
    echo "" > $nnformat
fi

# start namenode and yarn
$HADOOP_HOME/sbin/start-dfs.sh
$HADOOP_HOME/sbin/start-yarn.sh

# create dir user
$HADOOP_HOME/bin/hdfs dfs -mkdir /user
$HADOOP_HOME/bin/hdfs dfs -mkdir /user/root

# keep container running
tail -f /dev/null