FROM ubuntu:15.10

# Install Kafka
RUN apt-get update && \
    apt-get install -y --force-yes openjdk-8-jdk ca-certificates-java zlib1g-dev wget dnsutils tar build-essential python-dev libcurl4-nss-dev libsasl2-dev libsasl2-modules maven libapr1-dev libsvn-dev git && \
    apt-get remove -y openjdk-7-jre-headless && \
    rm -rf /var/lib/apt/lists/* && \
    apt-get clean && \
    wget -q http://apache.openmirror.de/mesos/0.28.1/mesos-0.28.1.tar.gz -O /tmp/mesos-0.28.1.tar.gz && \
    tar xfz /tmp/mesos-0.28.1.tar.gz -C /opt && \
    rm /tmp/mesos-0.28.1.tar.gz && \
    mv /opt/mesos-0.28.1 /opt/mesos && \
    set JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64 && \
    mkdir /opt/mesos/build && \
    cd /opt/mesos/build && \
    ../configure && make -j 2 V=0 && make install && ldconfig && rm /opt/mesos -R

EXPOSE 5050
