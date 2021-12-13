#!/bin/bash

####
#Accept a file as an argument
####

filename=$1

while read line; do 
cp $filename "$filename.bak"; 
done;

ls -l 

## this will loop through directory and update content wtih 
##filename and the phrase loops rule 

#for FILE in *; do echo -e "$FILE\nLoops Rule\!" > $FILE; cat $FILE; done
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