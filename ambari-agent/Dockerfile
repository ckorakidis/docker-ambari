FROM ambari-centos:1.0
MAINTAINER Arturo Bayo <arturo.bayo@gmail.com>
USER root

# Adding Ambari repository to YUM Repository
COPY files/ambari.repo /etc/yum.repos.d/.
RUN yum makecache
RUN yum install -y ambari-agent

# Deploy entrypoint
COPY files/setup-ambari-agent.sh /opt/run/01_setup-ambari-agent.sh
RUN chmod +x /opt/run/*.sh

# Deploy configuration
COPY files/ambari-agent.ini /etc/ambari-agent/conf/ambari-agent.ini

# Execute entrypoint
ENTRYPOINT ["/opt/bin/run_all.sh"]