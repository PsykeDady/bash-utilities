#!/bin/bash
dir_name=$(kdialog --inputbox "nome directory?" "Nome")

if [[ $dir_name == "" ]]; then exit; fi

if [[ ! -w . ]]; then  kdialog --error "non hai i permessi di scrittura" ; exit; fi 

if [[ ! -e $dir_name ]];
	then mkdir $dir_name
else
	kdialog --yesno "cartella esistente, spostare li?"
	[[ $? -ne 0 ]] &&  exit
fi

for selected in $*; do	
	mv "$selected" "$PWD"/"$dir_name/"
done	
