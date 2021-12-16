#!/bin/bash

echo "Starting backup task "

####
#Accept a file as an argument
####


filename=$1



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
then  touch /home/${line}/.backup
echo "created /home/$line/.backup"
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


# loop through all the files in the source called $FILE1
# list everything in recursive path

FILE1=/home/${USER}
FILE2=/tmp/backup/${USER}


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

# while
# if [[ -d "/home/${USER}" ]]
# then
#    while read -r line $file1; do
#    while read -r line $file2;do
#        if [ $file1==$file2 ] ; then
# for i in $file1; do
# new=$(printf "%file2." "$file2$a.")
# mv "$i" "$new"
# let a=a++
# done
# fi;