#!/bin/bash

USER="Dennis"
date
echo "Hello $USER!"
pwd
ps -ef | tail -n+2 | wc -l
ps -ef | grep -v grep | grep bioset | wc -l
ls -l /etc/passwd | awk '{print $1}'
