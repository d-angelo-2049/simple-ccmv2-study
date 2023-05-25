FROM ubuntu:18.04

# apt update & install java8
RUN apt update && apt install -y openjdk-8-jdk

# install maven
RUN apt install -y maven

# install YCSB
RUN apt install -y git
RUN git clone https://github.com/brianfrankcooper/YCSB.git
WORKDIR /YCSB
RUN mvn clean package -DskipTests

# install pip
RUN apt install -y python-pip

# Create a symlink to python2 as python
# RUN ln -s /usr/bin/python2 /usr/bin/python

# install ccm
RUN pip install ccm

# path
RUN export PATH=$PATH:/usr/local/bin
