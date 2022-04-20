#!/bin/bash

cat "text.txt" | wc --bytes
cat "text.txt" | wc -l
cat "text.txt" | wc -w
i=1
while dum= read -r line; do
    echo -n "<$i>:"; echo "[$line]" | wc -w
    ((i=i+1))
done < "text.txt"

i=1
while read line;
do 
  for words in $line;
  do
    echo "$i: $words" >> "temp1.txt"
    ((i=$i+1))
  done
done < "text.txt"
# sed -E 's/^[[:punct:]]*(\w*)[[:punct:]]*$/\1/' "temp1.txt" > "temp0.txt"

sort -u -k 2 "temp1.txt" > "temp2.txt"

sort -k 1n "temp2.txt" > "temp3.txt"

cut -d ":" -f2 "temp3.txt" > "temp4.txt"

rm "temp1.txt" 

while read word;
do
  v=$(grep -o -i "$word" "text.txt" | wc -l)
  
  if [ $v -gt 1 ]
  then
    echo -n "<$word>-["; grep -o "$word" "text.txt" | wc -l | tr -d "\n"; echo "]"
  fi
done < "temp4.txt"

rm "temp2.txt"
rm "temp3.txt"
rm "temp4.txt"