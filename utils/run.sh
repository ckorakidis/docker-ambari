#!/bin/bash

export REPO_HOME=`pwd`

# Name things the right way
NETWORK_NAME=bayo.int
DAMBARI_SERVER=ambari-server
DAMBARI_NODE01=node01
DAMBARI_NODE02=node02
DAMBARI_NODE03=node03

# Removing context containers
CONTAINERS_NAME=''
for CONTAINER in ${!DAMBARI_*}
do
	CONTAINERS_NAME="$CONTAINERS_NAME ${!CONTAINER}"
done

docker rm -f $CONTAINERS_NAME

# Restarting Docker network
echo "Restarting Docker network $NETWORK_NAME"
docker network rm $NETWORK_NAME
docker network create $NETWORK_NAME

# Start Docker Cluster
echo "Starting Cluster"

docker run -P -p 8080:8080 -d --name $DAMBARI_SERVER --net=$NETWORK_NAME ambari-server:1.0
# ambari-server setup -s
# ambari-server start


# for NODE in ${!DAMBARI_NODE*}
# do
# 	docker run -P -d --name ${!NODE} --net=$NETWORK_NAME ambari-centos:1.0
# done
