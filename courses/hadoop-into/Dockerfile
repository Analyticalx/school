FROM ubuntu:18.04

# # install packages
RUN \
  apt-get update && \
  apt-get install -y \
  ssh \
  rsync \
  openjdk-8-jdk \
  python3 \
  python3-pip

RUN \
  python3 -m pip install \
  flask \
  flask-cors

# set environment vars
ENV HADOOP_HOME /opt/hadoop
ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64

COPY hadoop-2.9.2.tar.gz hadoop-2.9.2.tar.gz
# RUN wget http://apache.mirrors.tds.net/hadoop/common/hadoop-2.9.2/hadoop-2.9.2.tar.gz

# create ssh keys
RUN \
   ssh-keygen -t rsa -P '' -f ~/.ssh/id_rsa && \
   cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys && \
   chmod 0600 ~/.ssh/authorized_keys

# copy analyticalx web
COPY analyticalx/web /opt/analyticalx/web

# copy analyticalx files
COPY analyticalx/files /root/analyticalx/files

# download and extract hadoop, set JAVA_HOME in hadoop-env.sh, update path
RUN \
  tar -xzf hadoop-2.9.2.tar.gz && \
  mv hadoop-2.9.2 $HADOOP_HOME && \
  echo "export JAVA_HOME=$JAVA_HOME" >> $HADOOP_HOME/etc/hadoop/hadoop-env.sh && \
  echo "PATH=$PATH:$HADOOP_HOME/bin" >> ~/.bashrc

# copy hadoop configs
ADD etc/hadoop/*xml $HADOOP_HOME/etc/hadoop/

# root connect ssh
RUN echo 'root:analyticalx' | chpasswd
RUN sed -ri 's/^#?PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config

# copy ssh config
ADD ssh_config /root/.ssh/config

# copy start hadoop
COPY start-hadoop.sh start-hadoop.sh

# Hdfs ports
EXPOSE 50010 50020 50070 50075 50090
# Mapred ports
EXPOSE 19888
#Yarn ports
EXPOSE 8030 8031 8032 8033 8040 8042 8088
#Other ports
EXPOSE 49707 2122   

# start hadoop
CMD ./start-hadoop.sh