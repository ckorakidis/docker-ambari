FROM ck/hdp-base
MAINTAINER Chris Korakidis <ckorakidis@gmail.com>
USER root

# Adding Ambari repository to YUM Repository
RUN \
    wget -O /etc/apt/sources.list.d/ambari.list http://public-repo-1.hortonworks.com/ambari/ubuntu16/2.x/updates/2.6.0.0/ambari.list &&\
    apt-key adv --recv-keys --keyserver keyserver.ubuntu.com B9733A7A07513CAD &&\
    apt-get update

RUN \
    apt-get install ambari-server -y

# Add hadoop group
ENV HADOOP_GROUP hadoop
RUN groupadd $HADOOP_GROUP

# Deploy entrypoint
COPY files/setup-ambari-server.sh /opt/run/01_setup-ambari-server.sh
RUN chmod +x /opt/run/*.sh

# Execute entrypoint
ENTRYPOINT ["/opt/bin/run_all.sh"]