#!/bin/bash
. $HOME/setup_bg.env
filename=${1}
while read -r line
do
	if [ -e ${AOUTDIR}/${line}.csv ]; then
		echo "file skipped"
	else
		./apivotfile.sh ${line}.csv
	fi
done < ${CONFDIR}/${filename}
