FROM ubuntu:16.04
MAINTAINER Chris Korakidis <ckorakidis@gmail.com>

RUN \
  apt-get update && \
  apt-get install -y openssh-server software-properties-common python-software-properties ntp && \
  apt-get clean

RUN \
  mkdir /var/run/sshd && \
  ssh-keygen -q -N "" -t rsa -f /root/.ssh/id_rsa && \
  cp /root/.ssh/id_rsa.pub /root/.ssh/authorized_keys && \
  sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd && \
  echo 'StrictHostKeyChecking no' > /root/.ssh/config && \
  ntpq -p

# java
RUN \
  echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
  add-apt-repository -y ppa:webupd8team/java && \
  apt-get update && \
  apt-get install -y oracle-java8-installer && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/* && \
  rm -rf /var/cache/oracle-jdk8-installer

ENV JAVA_HOME /usr/lib/jvm/java-8-oracle
ENV PATH $PATH:$JAVA_HOME/bin
RUN echo 'JAVA_HOME="/usr/lib/jvm/java-8-oracle"' >> /etc/environment

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