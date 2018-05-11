#!/bin/bash

## this script make a slideshow on every system
## choose as wallpaper from your settings an image called "wall" (without extension)
## every image in the directory you choose will renamed (one time for image) to "wall"


cartella=/home/archdady/Immagini/slideshow #write here path of directory-slideshow
cd $cartella 

while true; do
	for i in $(ls); do
		if [ "$i" != "wall" ]; then
			#echo "chang wall to $i"
			cp -f "$i" "wall"
			#echo "changed"
			sleep 120 #write here number of seconds you want to wait
		fi;
	done;
done;


