#!/bin/bash
#systemctl stop firewalld
rm edgeiplist*
rm output.txt
wget https://raw.githubusercontent.com/bedro96/pingtest/master/edgeiplist4.txt
input="./edgeiplist4.txt"
while IFS= read -r var
do
        pingresult=$(ping $var -i 1 -c 3 | tail -1)
        echo "ping $var: $pingresult"
        min=$(echo $pingresult | awk -F / '{print $4}' | cut -b 8- | sed 's/....$//' )
        avg=$(echo $pingresult | awk -F / '{print $5}' | sed 's/....$//' )
        max=$(echo $pingresult | awk -F / '{print $6}' | sed 's/....$//' )
        echo "min: $min"
        echo "avg: $avg"
        echo "max: $max"
        echo "$var,$min,$avg,$max" >> output.txt
done < "$input"
