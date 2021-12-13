#!/bin/bash

####
#Accept a file as an argument
####

filename=$1

for FILE in *; do echo -e "$FILE\nLoops Rule\!" > $FILE; cat $FILE; done
####
#reads through that file one line at a time
####


#while read line; do
#reading each line
#echo $line
#done < $filename


#for FILE in filename; do
#echo $FILE;
#done