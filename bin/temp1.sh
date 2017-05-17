#!/bin/bash
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
	sleep 20
	echo '--------------------------------'
done

