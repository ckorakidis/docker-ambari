FROM ambari-centos:1.0
MAINTAINER Arturo Bayo <arturo.bayo@gmail.com>
USER root

# Adding Ambari repository to YUM Repository
COPY files/ambari.repo /etc/yum.repos.d/.
RUN yum makecache
RUN yum install -y ambari-server

# Add hadoop group
ENV HADOOP_GROUP hadoop
RUN groupadd $HADOOP_GROUP

# Deploy entrypoint
COPY files/setup-ambari-server.sh /opt/run/01_setup-ambari-server.sh
RUN chmod +x /opt/run/*.sh

# Execute entrypoint
ENTRYPOINT ["/opt/bin/run_all.sh"]