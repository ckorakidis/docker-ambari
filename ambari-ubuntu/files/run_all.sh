#!/bin/bash

LOG=/var/log/all

touch $LOG

for a in /opt/run/*
do
   $a >> $LOG &
done

tail -f $LOG