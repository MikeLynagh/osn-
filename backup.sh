#!/bin/bash

####
#Accept a file as an argument
####

filename=$1

####
#reads through that file one line at a time
####


while read line; do
#reading each line
echo $line
done < $filename

####
# attempt to cycle through each file and back it up
####

while read line; do
timestamp=date +%b-%d-%y
sudo tar -cvpzf /home/backup-$timestamp.tar.gz filename


####
# Check if each home directory contains a file name.backup
####

test -f/tmp/backup
echo $?

####
# if a file called tmp/backup does not exist, make  a file with that name
###


if [[ ! -e/tmp/backup ]]; then
touch /tmp/backup
echo "a file called backup was created"
else
echo "a file called backup already exists"
fi
done

