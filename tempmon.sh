#!/bin/bash

REGEX0="Core 0:\s+\+([0-9]{2,3}\.[0-9])"
REGEX1="Core 1:\s+\+([0-9]{2,3}\.[0-9])"

while true

do

	CORE0="$(sensors | grep 'Core 0')"
	CORE1="$(sensors | grep 'Core 1')"


	if [[ $CORE0 =~ $REGEX0 ]]; then
		TEMP0=${BASH_REMATCH[1]}
	fi

	if [[ $CORE1 =~ $REGEX1 ]]; then
		TEMP1=${BASH_REMATCH[1]}
	fi

	DT=$(date "+%H:%M:%S %D")

	echo "$DT,$TEMP0,$TEMP1" >> ~/tempmon_log.csv
	sleep 5
done
