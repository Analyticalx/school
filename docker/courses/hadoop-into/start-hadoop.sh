#!/bin/bash

# start ssh server
/etc/init.d/ssh start

# format namenode
$HADOOP_HOME/bin/hdfs namenode -format

# start namenode and yarn
$HADOOP_HOME/sbin/start-dfs.sh
$HADOOP_HOME/sbin/start-yarn.sh

# create dir user
$HADOOP_HOME/bin/hdfs dfs -mkdir /user
$HADOOP_HOME/bin/hdfs dfs -mkdir /user/root

# keep container running
tail -f /dev/null