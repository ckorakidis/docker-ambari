FROM ck/hdp-base
MAINTAINER Chris Korakidis <ckorakidis@gmail.com>
USER root

# Adding Ambari repository to YUM Repository
RUN \
    wget -O /etc/apt/sources.list.d/ambari.list http://public-repo-1.hortonworks.com/ambari/ubuntu16/2.x/updates/2.6.0.0/ambari.list &&\
    apt-key adv --recv-keys --keyserver keyserver.ubuntu.com B9733A7A07513CAD &&\
    apt-get update

RUN \
    apt-get install ambari-agent -y


# Deploy entrypoint
COPY files/setup-ambari-agent.sh /opt/run/01_setup-ambari-agent.sh
RUN chmod +x /opt/run/*.sh

# Deploy configuration
COPY files/ambari-agent.ini /etc/ambari-agent/conf/ambari-agent.ini

# Execute entrypoint
ENTRYPOINT ["/opt/bin/run_all.sh"]