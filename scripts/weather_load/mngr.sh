#!/bin/bash
#FILES="/Users/aneeshreddy/Google_Drive/Sample_data/2000/Test"
#sourcing the following will setup all global variables for the rest of the environment

. ${HOME}/setup_bg.env

for file in `ls ${DATADIR}/*`
do
  datafile=`basename ${file}`
  echo "Processing $datafile file..."
  ${SCRIPTDIR}/scripter.sh ${datafile}
done
for tmp_file in `ls $TMPDIR/*`
do 
  datafile=`basename ${tmp_file}`
  echo "Processing $datafile file..."
  ${SCRIPTDIR}/pivotfile.sh ${datafile}
done
