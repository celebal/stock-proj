#!/bin/bash
. $HOME/setup_bg.env
FILES=${1}
for file in `ls ${OUTDIR}/${FILES}`
do 
	echo -n "${file}"
	num=`cat ${OUTDIR}/${FILES}/${file} | wc -c`
	echo -n "$num"
	if [ $num == 30 ]; then
		mv ${OUTDIR}/${FILES}/${file} ${OUTDIR}/${2} 
	fi
	echo
done
