#!/bin/bash
unzipped_file=${1}
. ${HOME}/setup_bg.env
cat ${TMPDIR}/station.txt | while read line
do
     grep "^$line" ${TMPDIR}/${unzipped_file} >> ${TMPDIR}/"$line".csv
done
