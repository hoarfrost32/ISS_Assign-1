#!/bin/bash
read line
echo $line | rev
echo $line | rev | tr "!-}" "\"-~"
strlen=${#line}

for (( i=$strlen/2 -1; i>=0; i-- ))
do
  echo -n ${line:i:1}
done

for (( i=$strlen/2; i<$strlen ; i++ ))
do
  echo -n ${line:i:1}
done
