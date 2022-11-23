#!/bin/bash

#show dates
for run in {1..10}
do
date +"%H:%M:%S"
# sleep 1
done

# processor
cat /proc/cpuinfo | grep -i 'model name' > file.txt

# operation sytem
cat /etc/os-release | grep -w NAME >> file.txt
cat /etc/os-release | grep -w NAME | sed -e 's/NAME=//g' -e 's/"//g' >> file.txt

# create files
for i in {50..100}; do touch file$i.txt; done
