#!/bin/bash

a=$(cat  /sys/class/backlight/intel_backlight/brightness)
max=$(cat /sys/class/backlight/intel_backlight/max_brightness)
p=0
let "p=max*10/100"
let "a-=p"
if(( a<0 )); then
  let "a=0"
fi
echo $a > /sys/class/backlight/intel_backlight/brightness
