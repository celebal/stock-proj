#!/bin/bash
. $HOME/setup_bg.env
for file in `ls ${CONFDIR}`
do
	echo "Filename: $file"
	./wrapper.sh ${file}
done
