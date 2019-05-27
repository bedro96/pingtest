#!/bin/bash

# East US       10.100.2.4 104.211.20.141
# West US       10.101.2.4 104.42.114.246
# Canada East   10.102.2.4 40.86.202.250
# Brazil South  10.103.2.4 191.239.255.52
# UK South      10.104.2.4 51.140.92.167
# West Europe   10.105.2.4 13.81.43.199
# Australia East 10.107.2.4 52.187.198.95
# West India    10.108.2.4 104.211.137.57
# Southeast Asia 10.109.2.4 104.43.19.3
# Korea Central 10.106.2.4 52.141.35.191

ips=(   "10.100.2.4"
        "10.101.2.4"
        "10.102.2.4"
        "10.103.2.4"
        "10.104.2.4"
        "10.105.2.4"
        "10.107.2.4"
        "10.108.2.4"
        "10.109.2.4" )

for i in "${ips[@]}"
do
	echo $i
    pingresult=$(ping $i -i 1 -c 3 | tail -1)
    echo "ping $i: $pingresult"
    min=$(echo $pingresult | awk -F / '{print $4}' | cut -b 8- | sed 's/....$//' )
    avg=$(echo $pingresult | awk -F / '{print $5}' | sed 's/....$//' )
    max=$(echo $pingresult | awk -F / '{print $6}' | sed 's/....$//' )
    echo "min: $min"
    echo "avg: $avg"
    echo "max: $max"
    echo "$i,$min,$avg,$max" >> output.txt
done