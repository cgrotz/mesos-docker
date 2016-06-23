FROM ubuntu:15.10

# Install Kafka
RUN apt-get update && \
    apt-get install -y --force-yes openjdk-8-jdk zlib1g-dev wget dnsutils tar build-essential python-dev libcurl4-nss-dev libsasl2-dev libsasl2-modules maven libapr1-dev libsvn-dev git && \
    rm -rf /var/lib/apt/lists/* && \
    apt-get clean && \
    wget -q http://apache.openmirror.de/mesos/0.28.2/mesos-0.28.2.tar.gz -O /tmp/mesos-0.28.2.tar.gz && \
    tar xfz /tmp/mesos-0.28.2.tar.gz -C /opt && \
    rm /tmp/mesos-0.28.2.tar.gz && \
    mv /opt/mesos-0.28.2 /opt/mesos

RUN mkdir /opt/mesos/build

WORKDIR /opt/mesos/build

RUN ../configure && make && make install

EXPOSE 5050
