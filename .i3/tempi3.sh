#!/bin/bash
file_ther0="/sys/class/thermal/thermal_zone0/temp"
file_ther1="/sys/class/thermal/thermal_zone1/temp"
ther0=$(cat "$file_ther0")
ther0=$((ther0 / 1000))
echo "$ther0 C"
