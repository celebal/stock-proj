#!/bin/bash
lat1="$1"
lon1="$2"
t="$3"
while read -r line
do
	lat2=`echo $line | awk -F" " '{print $2}'`
	lon2=`echo $line | awk -F" " '{print $3}'`
	dist=`python haversine.py $lat1 $lon1 $lat2 $lon2`
	if [ `echo | awk -v n1=$dist -v n2=$t '{if (n1<n2) printf ("1\n"); else printf ("0\n");}'` -eq 1 ]; then
		echo "$dist $line"
	fi
done < test.txt
