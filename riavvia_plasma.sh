#!/bin/bash
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
