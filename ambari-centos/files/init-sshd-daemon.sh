#!/bin/bash

echo "Init ssh daemon."

#sleep 3s

/etc/init.d/sshd start
#systemctl enable sshd