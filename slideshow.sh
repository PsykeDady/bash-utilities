#!/bin/bash

## this script make a slideshow on every system
## choose as wallpaper from your settings an image called "wall" (without extension)
## every image in the directory you choose will renamed (one time for image) to "wall"


cartella=/home/psykedady/Immagini/Wallpapers #write here path of directory-slideshow
cd $cartella 

OIFS=$IFS;
IFS=$'\n';
while true; do
	for i in $(ls); do
		echo $i;
		if [[ "$i" != "wall" && "$i" != "lock" ]]; then
			echo "chang wall to $i"
			cp -f "$i" "wall"
			echo "changed"
			sleep 10 #write here number of seconds you want to wait
		fi;
	done;
done;
IFS=$OIFS;

