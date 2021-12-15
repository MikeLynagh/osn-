#!/bin/bash

echo "Starting backup task "

####
#Accept a file as an argument
####


fILENAME=$1

FILE1=/home/${USER}/*.*
FILE2=/tmp/backup/${USER}/*.*
a=1

####
# Go through that file and print all of the users in that file 
####

while read line; do 
echo $line 
done < $filename

####
#check if backup folder exists for each user
#if backup folder does not exist, then create one for each person at home/user.backup
####

while read -r line; do
echo "beginning to run backup file check on files"
if [ ! -f /home/"${line}"/.backup ];
echo "there is no backup file for ${line}"
then  touch /home/${fILENAME}/.backup
fi

done < $filename

####
# if a file called /var/backup.tar.gz exists, extract to /tmp/backup
####
if [ -f var/backup.tar.gz ];then
tar -tvf var/backup.tar.gz 
tar -xvf var/backup.tar.gz -C /tmp/backup
fi

####
# final part
# create variable with /home/${USER}/.
#create another variable with /tmp/back/${USER}
####



while
if [[ -d "/home/${USER}" ]]
then
   while read -r line $file1; do
   while read -r line $file2;do
       if [ $file1==$file2 ] ; then
for i in $file1; do
new=$(printf "%file2." "$file2$a.")
mv "$i" "$new"
let a=a++
done
fi