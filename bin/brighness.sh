#!/bin/bash	

current=$(cat /sys/class/backlight/intel_backlight/brightness)
max=$(cat /sys/class/backlight/intel_backlight/max_brightness)

percent=$(( 100*current/max))
echo "$percent%"
echo "$percent%"
