#!/bin/bash

# Build steps
cd ambari-centos && ./build.sh
cd ../ambari-server && ./build.sh
cd ../ambari-agent && ./build.sh
