#!/bin/bash

# Build steps
cd ../ambari-ubuntu && ./build.sh
cd ../ambari-server && ./build.sh
cd ../ambari-agent && ./build.sh
