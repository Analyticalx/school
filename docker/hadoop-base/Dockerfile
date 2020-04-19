FROM ubuntu:18.04

# set environment vars
ENV HADOOP_HOME /opt/hadoop
ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64

ENV HDFS_DATANODE_USER=root
#ENV HDFS_DATANODE_SECURE_USER=hdfs
ENV HDFS_NAMENODE_USER=root
ENV HDFS_SECONDARYNAMENODE_USER=root
ENV YARN_RESOURCEMANAGER_USER=root
ENV YARN_NODEMANAGER_USER=root

# install packages
RUN \
  apt-get update && apt-get install -y \
  ssh \
  rsync \
  vim \
  openjdk-8-jdk \
  python3 \
  python3-pip

RUN \
  python3 -m pip install \
  flask \
  flask-cors

# COPY hadoop-3.2.1.tar.gz hadoop-3.2.1.tar.gz
RUN wget http://apache.mirrors.tds.net/hadoop/common/hadoop-3.2.1/hadoop-3.2.1.tar.gz

# download and extract hadoop, set JAVA_HOME in hadoop-env.sh, update path
RUN \
  tar -xzf hadoop-3.2.1.tar.gz && \
  mv hadoop-3.2.1 $HADOOP_HOME && \
  echo "export JAVA_HOME=$JAVA_HOME" >> $HADOOP_HOME/etc/hadoop/hadoop-env.sh && \
  echo "PATH=$PATH:$HADOOP_HOME/bin" >> ~/.bashrc

# root connect ssh
RUN echo 'root:analyticalx' | chpasswd
RUN sed -ri 's/^#?PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config

# create ssh keys
RUN \
  ssh-keygen -t rsa -P '' -f ~/.ssh/id_rsa && \
  cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys && \
  chmod 0600 ~/.ssh/authorized_keys

# copy ssh config
ADD configs/ssh_config /root/.ssh/config
