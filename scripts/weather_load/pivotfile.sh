#!/bin/sh
. ${HOME}/setup_bg.env
infile=${1}

egrep "TMAX|TMIN" ${TMPDIR}/${infile} > /dev/null
if [ $? = 1 ]; then
	echo "Invalid file. Does not have mandatatory fields. Rejected...."
	exit 1
fi

station=`echo ${TMPDIR}/${infile} | awk -F'_' '{ print $1 }' `
startdate=`head -1 ${TMPDIR}/${infile} | awk  '{ print $2 }' `
#echo "18151010" | awk '{ print substr($0,1,4)"-"substr($0,5,2)"-"substr($0,7,2) }'
formatteddate=`echo ${startdate} | awk '{ print substr($0,1,4)"-"substr($0,5,2)"-"substr($0,7,2) }'`

echo "formatted date: ${formatteddate}\n"

TMAXValue=0
TMINValue=0
SNOWValue=0
SNWDValue=0
PRCPValue=0

rowsread=0

echo  "DATE\tTMAX\tTMIN\tSNOW\tSNWD\tPRCP" > ${OUTDIR}/${1}

while  read station curdate type value
do
rowsread=`expr $rowsread + 1`
#echo "curdate: $curdate  type=$type value : $value\n"

if [ "X${curdate}" != "X${startdate}" ]; then
echo "formatted date: ${formatteddate}\n"
	echo  "$formatteddate\t$TMAXValue\t$TMINValue\t$SNOWValue\t$SNWDValue\t$PRCPValue" >> ${OUTDIR}/${1}
	rowsread=0
	startdate=${curdate}
echo "cur date: ${curdate}\n"
	#formatteddate=`echo ${curdate} | date '+%Y-%m-%d'`
	formatteddate=`echo ${curdate} | awk '{ print substr($0,1,4)"-"substr($0,5,2)"-"substr($0,7,2) }'`
TMAXValue=0
TMINValue=0
SNOWValue=0
SNWDValue=0
PRCPValue=0
fi



case "${type}" in

   "TMAX") 
	TMAXValue=${value}
   ;;
   "TMIN") 
	TMINValue=${value}
   ;;
   "SNOW") 
	SNOWValue=${value}
   ;;
   "SNWD") 
	SNWDValue=${value}
   ;;
   "PRCP") 
	PRCPValue=${value}
   ;;
esac




done < ${TMPDIR}/${infile}

if [ $rowsread -gt 0 ]; then

	echo  "$formatteddate\t$TMAXValue\t$TMINValue\t$SNOWValue\t$SNWDValue\t$PRCPValue" >> ${OUTDIR}/${1}

fi
