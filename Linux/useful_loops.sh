#!/bin/bash

#creates a list that includes shadow and passwd
filelist=('/etc/shadow' '/etc/passwd')


#this is a loop that will display the permissions of shadow and passwd
for file in ${filelist[@]};
do
	echo "$(ls -l $file)"
done




