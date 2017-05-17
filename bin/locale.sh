#!/bin/bash

locale=$(localectl status | grep -Eom 1 "\=.{1,2}")
locale=${locale:1:2}
echo $locale
