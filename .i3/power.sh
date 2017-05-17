#!/bin/bash

path=/sys/class/power_supply/BAT1/
shown_full=0
shown_dc=0
shown_30=0
shown_10=0
shown_charge=0

while :
do
	state=$(cat $path/status)
	capacity=$(cat $path/capacity)
	if [ "$state" == "Full" ] && [ $shown_full -eq 0 ]; then
	       shown_full=1
	       notify-send "Battery is full, please unplug power_supply"
        fi
	if [ "$state" == "Discharging" ] && [ $shown_dc -eq 0 ]; then
		shown_dc=1
		notify-send "Battery discharging"
	fi
	if [ "$state" == "Discharging" ] && [ $capacity -lt 30 ] && [ $shown_30 -eq 0 ]; then
		shown_30=1
		notify-send "Battery, is getting lower than 30%"
	fi
	if [ "$state" == "Discharging" ] && [ $capacity -lt 10 ] && [ $shown_10 -eq 0 ]; then
		shown_10=1
		notify-send "Battery, is getting lower than 10%"
	fi
	if [ "$state" == "Charging" ] && [ $shown_charge -eq 0 ]; then
	       shown_charge=1
	       notify-send "Battery is Charging"
        fi
	sleep 30
done

       		       
