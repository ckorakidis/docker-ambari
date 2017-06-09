#!/bin/bash

echo "Setting up ambari-server"

ambari-server setup -s
ambari-server start