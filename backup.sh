#!/bin/bash

# student name; Michael Lynagh 

# student number 10584831

# course module code B8IT143_2122_TME1S

# course name Operating Systems and Networks

# course lecturer Paul Paird


####
# If there is no file added to the script, basch script will say 
# "no arguments supplied" and exit
####
if [ $# -eq 0 ]; then 
	echo "No arguments supplied"
	exit
fi
# show on screen that the backup script is starting 
echo "Starting backup task "
####
#Accept a file as an argument
####
filename=$1
####
# Go through that file and print all of the users in that file 
####
while read username; do 
echo $username
done < $filename
####
#check if backup folder exists for each user 
#if backup folder does not exist, then create one for each person at home/user/.backup
####
while read -r username; do
echo "beginning to run backup file check on files"
#if the file .backup is not present for the user 
if [ ! -f /home/"${username}"/.backup ];
echo "there is no backup file for ${username}"
# create the file home/$username/.backup
then  touch /home/${username}/.backup
echo "created /home/$username/.backup"
fi
done < $filename
####
# if a file called /var/backup.tar.gz exists, extract to /tmp/backup
####
while read -r username; do
if [ -f var/backup.tar.gz ];then
tar -tvf var/backup.tar.gz 
tar -xvf var/backup.tar.gz -C /tmp/backup
fi	
#####
# create variables for source and destination of backup for files 
#####
# source for files to backup is FILE1
FILE1=/home/${USER}
# destianation for backed up files to copy to is 
FILE2=/tmp/backup/${USER}
# go through files in FILE1
for file in $(find $FILE1 -printf "%P\n") ; do
# check if the file in FILE2 has already appeared in $FILE1
    if [ -a $FILE2/$file ] ; then
# if the file in FILE1 is newer than  FILE2
        if [ $FILE1/$file -nt $FILE2/$file ] ; then
        echo "newer file detected, copying"
# copy files from FILE1  to FILE2
        cp -r $FILE1/$file $FILE2/$file
        else
        echo "file $file exists, skipping"
        fi
    else
    echo $file " is being copied over to $FILE2"
    cp -r $FILE1/$file $FILE2/$file
    fi
done
####
#for files in FILE2, tar with gzip compression to /var/backup.tar.gz
####
for file in $(FILE2); do
tar -tvf var/backup.tar.gz
tar -xzvf var/backup.tar.gz /tmp/backup
done
done 