#!/bin/bash
a=$(cat  /sys/class/backlight/intel_backlight/brightness)
max=$(cat  /sys/class/backlight/intel_backlight/max_brightness)
p=0
let "p=max*10/100"
let "a+=p"
if(( a>max )); then
  let "a=max"
fi
echo $a > /sys/class/backlight/intel_backlight/brightness
