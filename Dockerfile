FROM ubuntu:18.04

# install various software
RUN apt update \
    && apt install -y maven git vim net-tools curl

# install oracle-jdk-1.8.0_181
COPY jdk-8u181-linux-x64.tar.gz /tmp/jdk-8u181-linux-x64.tar.gz
RUN tar -xf /tmp/jdk-8u181-linux-x64.tar.gz -C /opt/ \
    && mv /opt/jdk1.8.0_181 /opt/java \
    && rm /tmp/jdk-8u181-linux-x64.tar.gz
ENV JAVA_HOME=/opt/java
ENV PATH=$JAVA_HOME/bin:$PATH

RUN git clone https://github.com/brianfrankcooper/YCSB.git
WORKDIR /YCSB
RUN mvn clean package -DskipTests

# install pip
RUN apt install -y python-pip

# install ccm
RUN pip install ccm

# path
RUN export PATH=$PATH:/usr/local/
