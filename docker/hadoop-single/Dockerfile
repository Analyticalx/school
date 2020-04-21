FROM analyticalx/hadoop-base

# copy hadoop configs
ADD configs/*xml $HADOOP_HOME/etc/hadoop/

# copy script to start hadoop
ADD start-hadoop.sh /opt/analyticalx/start-hadoop.sh

# expose various ports
EXPOSE 22 8088 9870 50070 50075 50030 50060

# start hadoop
CMD bash /opt/analyticalx/start-hadoop.sh
