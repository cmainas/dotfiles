#!/bin/bash

# show charging icon if the laptop is charging
charging=$(acpi -V | grep -Eo 'Adapter\ 0:\ on-line')
# get remaining battery time
remaining=$(< /sys/class/power_supply/BAT1/capacity)
if [ -n "$charging" ]; then
	#echo "AC:$remaining %"
	if [ $remaining -eq 100 ]; then
		echo "AC:$remaining %"
		echo
		echo "#00ff00"
	else
		echo "AC:$remaining %"
		echo
		echo "#02a4fc"
	fi
fi

#echo "ON BAT:$remaining %"
if [ $remaining -lt 30 ]; then
	echo "ON BAT:$remaining %"
	echo
	echo "#fc6a02"
elif [ $remaining -lt 10 ]; then
	echo "ON BAT:$remaining %"
	echo
	echo "#00ffff"
else
	echo "ON BAT:$remaining %"
	echo
	echo "#ffffff"
fi

