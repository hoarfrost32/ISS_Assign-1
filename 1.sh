#!/bin/bash

echo "/----------------------------------------------------------/"
echo "Output after removing empty lines:"; sed '/^$/d' quotes.txt 

i=1
while read line 
do 
  echo "$i: $line" >> "temp.txt"
  ((i=$i+1))
done < "quotes.txt"

echo "/----------------------------------------------------------/"
echo "Output after removing duplicate lines:"

sort -u -k 2 "temp.txt" > "temp2.txt"

sort -u -k 1n "temp2.txt" > "temp3.txt"

cat temp3.txt

cut -d ":" -f2 temp3.txt >> temp4.txt

cut -d ":" -f2 temp4.txt

rm temp.txt
rm temp2.txt
rm temp3.txt
rm temp4.txt