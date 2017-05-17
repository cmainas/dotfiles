#!/bin/bash
counter=0
avg=0
max=0
min=90000
file_ther0="/sys/class/thermal/thermal_zone0/temp"
file_ther1="/sys/class/thermal/thermal_zone1/temp"
file_ther2="/sys/class/thermal/thermal_zone2/temp"
while : 
do
	ther0=$(cat "$file_ther0")
	ther1=$(cat "$file_ther1")
	ther2=$(cat "$file_ther2")
	ther0=$((ther0 / 1000))
	ther1=$((ther1 / 1000))
	ther2=$((ther2 / 1000))
	echo "thermal zone0: $ther0 C"
	echo "thermal zone1: $ther1 C"
	echo "thermal zone2: $ther2 C"
	if [ "$ther0" -gt "$max" ]
	then
		max=$ther0
	fi
	if [ "$ther1" -gt "$max" ]
	then
		max=$ther1
	fi
	if [ "$ther2" -gt "$max" ]
	then
		max=$ther2
	fi
	if [ "$ther0" -lt "$min" ]
	then
		min=$ther0
	fi
	if [ "$ther1" -lt "$min" ]
	then
		min=$ther1
	fi
	if [ "$ther2" -lt "$min" ]
	then
		min=$ther2
	fi
	counter=$(($counter + 1))
	sum=$(($sum + $ther0))
	avg=$(($sum / $counter))
	echo "max: $max C"
	echo "min: $min C"
	echo "average: $avg C"
	sleep 20
	echo '--------------------------------'
done

