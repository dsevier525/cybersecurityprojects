#!/bin/bash

if [ "$USER" != "root" ]
then
outputfile="/home/sysadmin/research/sys_info.txt"
outputpath="/home/sysadmin/research"

#Creates the output directory if it doesn't exist
if [ ! -d $ouputpath ]
then  
mkdir $outputpath
fi

#If the sys_info.txt file exists then remove it
if [ -f $outputfile ]
then
rm $outputfile
else
touch $outputfile
fi

ipinfo="$(ip addr | grep inet | tail -2 | head -1)"


echo "A quick system audit script" >> $outputfile
date >> $outputfile
echo -e "Machine Type  Info: $MACHTYPE \n" >> $outputfile
echo -e "Uname Info: $(uname) \n" >> $outputfile
echo -e  "IP Info: $ipinfo \n" >> $outputfile
echo -e "Hostname Info: $(hostname) \n" >> $outputfile

execlist="$(find /home -type f -perm 777)" 

#command to find executables 
echo -e "\nExec Files: $execlist" >> $outputfile

#Command to display the 10 most active processes
echo -e "\n Top 10 Processes" >> $outputfile
ps -aux --sort=%mem | head | awk '{print $1, $2, $3, $4, $11}' >> $outputfile

else
echo "Do not run this using sudo. Exiting script."
fi
