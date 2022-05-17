#!/bin/bash

fav_states=('California' 'Texas' 'Idaho' 'Florida' 'Hawaii')
counter=0

for state in ${fav_states[@]};
do
	if [ $state = 'Hawaii' ]
	then
	let counter=$counter+1
	fi
done

if [ $counter -gt 0 ]
then
echo "Hawaii is the best!"
else
echo "I'm not fond of Hawaii."
fi

nums=$(echo {0..9})

for num in ${nums[@]};
do
	if [ $num = 3 ] || [ $num = 5 ] || [ $num = 7 ]
	then
	echo $num
	fi
done

myfiles=$(ls)

for file in ${myfiles[@]};
do
	echo $file
done
