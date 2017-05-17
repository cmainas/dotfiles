#!/bin/bash

# show charging icon if the laptop is charging
charging=$(cat /sys/class/power_supply/BAT1/status)
# get remaining battery time
remaining=$(cat /sys/class/power_supply/BAT1/capacity)
if [ "$charging" == "Charging" ]; then
	#echo "AC:$remaining %"
#	if [ $remaining -eq 100 ]; then
#		echo "AC:$remaining %"
#		echo
#		echo "#00ff00"
#	else
		echo "AC:$remaining %"
		echo
		echo "#02a4fc"
#	fi
elif [ "$charging" == "Full" ]; then
	echo "AC:$remaining %"
	echo
	echo "#00ff00"
else
	#echo "ON BAT:$remaining %"
	if [ $remaining -lt 30 ] && [ $remaining -gt 9 ]; then
		echo "ON BAT:$remaining %"
		echo
		echo "#fc6a02"
	elif [ $remaining -lt 10 ]; then
		echo "ON BAT:$remaining %"
		echo
		echo "#ff0000"
	else
		echo "ON BAT:$remaining %"
		echo
		echo "#ffffff"
	fi
fi

