#!/usr/bin/bash	

cpu=$(mpstat | awk 'NR==4 {print $4 + $5 + $6}')
cpu_int=$((10#$temp * 100))

if [ "$cpu_int" -gt 8000 ]; then
	echo $cpu%
	echo $cpu%
	echo #f79800
elif [ "$cpu_int" -gt 9500 ]; then
	echo $cpu%
	echo $cpu%
	echo #ff0000
else
	echo $cpu%
fi

	

