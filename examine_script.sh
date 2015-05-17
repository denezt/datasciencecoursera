#!/bin/bash
#Created By: 	Richard L. Jackson
#Purpose:	Read CSV Data	

count=1
for i in 001
do
	ARRVAR=($(cat specdata/$i.csv | grep [0-9] | tr "," " " | \
	cut -d" " -f3 | \
	grep -v "NA"))

	ARRSZ=${#ARRVAR[*]}
	for (( INCR = 0; $INCR < $ARRSZ; INCR++ ))
	do
		printf "[$INCR] ${ARRVAR[$INCR]}\n"
		c=`expr "$u + ${ARRVAR[$INCR]}"`
	done
	echo $c

done
