#!/bin/bash

echo $(($(< /sys/class/backlight/intel_backlight/brightness) + 1)) > /sys/class/backlight/intel_backlight/brightness
