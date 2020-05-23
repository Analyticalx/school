FROM ubuntu:18.04

RUN apt-get update

RUN  apt-get install -y openjdk-8-jdk

RUN  apt-get install -y wget vim python

RUN wget http://mirror.nbtelecom.com.br/apache/spark/spark-2.4.5/spark-2.4.5-bin-hadoop2.7.tgz
# COPY spark-2.4.5-bin-hadoop2.7.tgz spark-2.4.5-bin-hadoop2.7.tgz

RUN tar zxvf spark-2.4.5-bin-hadoop2.7.tgz

RUN mv spark-2.4.5-bin-hadoop2.7 /opt/

RUN rm -f spark-2.4.5-bin-hadoop2.7.tgz

RUN wget http://mirror.nbtelecom.com.br/apache/zeppelin/zeppelin-0.8.2/zeppelin-0.8.2-bin-all.tgz
# COPY zeppelin-0.8.2-bin-all.tgz zeppelin-0.8.2-bin-all.tgz

RUN tar zxvf zeppelin-0.8.2-bin-all.tgz

RUN mv zeppelin-0.8.2-bin-all /opt/

RUN rm -f zeppelin-0.8.2-bin-all.tgz

COPY zeppelin-env.sh /opt/zeppelin-0.8.2-bin-all/conf/zeppelin-env.sh

COPY start.sh start.sh

RUN chmod +x start.sh

EXPOSE 8080 

CMD ./start.sh

