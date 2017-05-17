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
	shown_30=0
	shown_10=0
	shown_full=0
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
	shown_full=0
fi

if [ "$charging" == "Full" ] && [ $shown_full -eq 0 ]; then
	shown_full=1
	notify-send --urgency=normal "Battery is full, please unplug power_supply"
	shown_30=0
	shown_10=0
fi
if [ "$charging" == "Discharging" ] && [ $remaining -lt 30 ] && [ $shown_30 -eq 0 ]; then
	shown_30=1
	notify-send --urgency=normal "Battery, is getting lower than 30%"
fi
if [ "$charging" == "Discharging" ] && [ $remaining -lt 10 ] && [ $shown_10 -eq 0 ]; then
	shown_10=1
	notify-send --urgency=critical "Battery, is getting lower than 10%"
fi
