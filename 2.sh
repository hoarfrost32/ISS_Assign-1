#!/bin/bash

> "speech.txt"
while read line
do 
  v=$(echo $line | wc -c)
  if [ $v -gt 0 ]
  then
    echo $line | cut -d "~" -f2 | tr -d '\n' >> "speech.txt"; echo -n " once said, " >> "speech.txt"; echo -n "\"" >> "speech.txt"; echo $line | cut -d "~" -f1 | tr -d '\n' >> "speech.txt"; echo "\"" >> "speech.txt"
  fi
done < "quotes.txt"

sed -i 's/ once said, \"\"/ /g ' speech.txt

sed -i 's/\. \"/."/g' speech.txt