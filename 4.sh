#!/bin/bash

read arr

array=( $(echo $arr | tr "," " ") )

len=${#array[@]}

for((i=0; i<$len-1; i++))
do
	for((j=i+1; j<$len; j++))
	do
		if [ ${array[$i]} -gt ${array[$j]} ]
		then
			swap=${array[$j]}
			array[$j]=${array[$i]}
			array[$i]=$swap
		fi
	done
done

echo ${array[*]} | tr " " ","