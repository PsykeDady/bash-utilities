#!/bin/bash
xrandr

xrandr --output DP-2  --mode 2560x1440 --scale 1x1 --pos 2880x135 --output HDMI-0 --mode 1920x1080 --pos 0x0 --scale 1.5x1.5 --fb 5440x1620  
killall latte-dock
killall plasmashell

echo -n "reboot plasma in 2 seconds"
sleep 1s
echo -n '.'
sleep 1s
echo '.'
(kstart5 plasmashell&)

echo "replace kwin";
(kwin_x11 --replace&);

echo -n "reboot latte dock in 2seconds"
sleep 1s
echo -n "."
sleep 1s 
echo "."

(latte-dock&)
