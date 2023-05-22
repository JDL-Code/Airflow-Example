FROM apache/airflow:2.5.1

USER root
RUN apt-get update && apt-get install wget unzip -y
WORKDIR /opt/oracle
RUN wget https://download.oracle.com/otn_software/linux/instantclient/214000/instantclient-basic-linux.x64-21.4.0.0.0dbru.zip
RUN unzip instantclient-basic-linux.x64-21.4.0.0.0dbru.zip && rm instantclient-basic-linux.x64-21.4.0.0.0dbru.zip
RUN apt-get install libaio1 -y
RUN echo /opt/oracle/instantclient_21_4 > /etc/ld.so.conf.d/oracle-instantclient.conf
RUN ldconfig

USER default
WORKDIR /opt/airflow
