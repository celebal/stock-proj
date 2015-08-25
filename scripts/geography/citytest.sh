#!/bin/bash
. $HOME/setup_bg.env
filename=${1}
mkdir ${OUTDIR}/${2}
cat ${DATADIR}/${filename} | while read line
do 
	if [ -e ${CONFDIR}/${line}.csv ]; then
		cp ${CONFDIR}/${line}.csv ${OUTDIR}/${2}
	fi
done
