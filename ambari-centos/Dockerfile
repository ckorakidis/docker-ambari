FROM centos:6.8
MAINTAINER Arturo Bayo <arturo.bayo@gmail.com>
USER root

# Removing cached packages, headers and fixing possible RPM database errors (/var/lib/rpm)
RUN yum clean all && rpm --rebuilddb && yum update -y;

# Installing Linux commands and utils
RUN yum install -y curl wget scp unzip tar sudo ntp openssh-clients openssh-server
#RUN yum update -y

# Configure NTP
RUN chkconfig ntpd on && /etc/init.d/ntpd start

# Configure SSHD
COPY files/ssh_rsa_key.pub /root/.ssh/authorized_keys
COPY files/ssh_rsa_key.pub /root/.ssh/id_rsa.pub
COPY files/ssh_rsa_key /root/.ssh/id_rsa
RUN chmod 400 /root/.ssh/id_rsa*
RUN chkconfig sshd on; /etc/init.d/sshd start

# Java Development Kit (JDK) 1.7.0_71 & Configuring Java Path Variables
RUN curl -LO 'http://download.oracle.com/otn-pub/java/jdk/8u131-b11/d54c1d3a095b4ff2b6607d096fa80163/jdk-8u131-linux-x64.rpm' -H 'Cookie: oraclelicense=accept-securebackup-cookie' && rpm -i jdk-8u131-linux-x64.rpm && rm jdk-8u131-linux-x64.rpm
ENV JAVA_HOME /usr/java/default
ENV PATH $PATH:$JAVA_HOME/bin

# Creating run and bin folders to automatize the entrypoint dockerfile images executions
RUN mkdir /opt/bin && mkdir /opt/run
COPY files/run_all.sh /opt/bin/
RUN chmod +x /opt/bin/run_all.sh

# Deploy entrypoint
COPY files/idle.sh /opt/run/99_idle.sh
COPY files/init-sshd-daemon.sh /opt/run/00_init-sshd-daemon.sh
RUN chmod +x /opt/run/*.sh

# Execute entrypoint
ENTRYPOINT ["/opt/bin/run_all.sh"]