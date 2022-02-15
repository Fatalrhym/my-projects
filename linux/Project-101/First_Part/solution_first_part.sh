#! /bin/bash

cat event_history.csv | grep -i "serdar" > serdar.txt
cat serdar.txt | grep -i "terminate" > terminate.txt
cat terminate.txt | grep -o '\bi-\w*' > result.txt

# alternative solution

#!/bin/bash

if [[ ! -f $1  ]]
then
        echo "please type a file"
        exit
fi


cat $1 | grep serdar | grep Terminate | grep -Eo "i-[a-zA-Z0-9]{17}" | sort -u > result.txt