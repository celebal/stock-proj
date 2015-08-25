#!/bin/bash
zipped_file=${1}
. ${HOME}/setup_bg.env

unzipped_file=`echo ${zipped_file} | sed 's/\.gz//g'`
gunzip -c ${DATADIR}/$zipped_file > ${TMPDIR}/${unzipped_file}
awk -F"," -v OFS=',' '/^US/ {print $1, $2, $3, $4}' ${TMPDIR}/${unzipped_file} > ${TMPDIR}/${unzipped_file}.tmp && mv ${TMPDIR}/${unzipped_file}.tmp  ${TMPDIR}/${unzipped_file}
awk -F',' ' { printf "%s\t%s\t%s\t%s\n", $1,$2,$3,$4 }' ${TMPDIR}/${unzipped_file} > ${TMPDIR}/${unzipped_file}.tmp 
mv ${TMPDIR}/${unzipped_file}.tmp ${TMPDIR}/${unzipped_file} 
awk -F'\t' '{print $1}' ${TMPDIR}/${unzipped_file} | sort | uniq > ${TMPDIR}/station.txt
./dataMaker.sh ${unzipped_file} 
rm ${TMPDIR}/${unzipped_file}
rm ${TMPDIR}/station.txt
