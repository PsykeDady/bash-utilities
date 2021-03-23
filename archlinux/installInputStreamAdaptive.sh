#!/bin/bash

if (( $#==0 )); then 
	kodidir=$(pwd)/xbmc
else 
	kodidir=$1
fi

if [[ ! -d $kodidir ]]; then
	echo "devi aver compilato kodi in una cartella denominata $kodidir e deve trovarsi nella cartella locale se non è un percorso assoluto. Riprova"
	return 255;
fi

if [[ ! -d $kodidir/tools/depends/target/binary-addons/ ]]; then 
	echo "non hai compilato adeguatamente kodi, compila kodi e quindi riprova ad eseguire lo script"
	return 255;
fi

echo "cd $kodidir/tools/depends/target/binary-addons/"
cd "$kodidir"/tools/depends/target/binary-addons/ || return 255

echo "make PREFIX=$kodidir ADDONS=\"inputstream.adaptive\""
make PREFIX="$kodidir" ADDONS="inputstream.adaptive"|| return 255

echo "add_dir=$HOME/.config/kodi/addons"
add_dir=$HOME/.config/kodi/addons

echo "cp -r $kodidir/share/kodi/addons/inputstream.adaptive $add_dir"
cp -r "$kodidir"/share/kodi/addons/inputstream.adaptive "$add_dir"
echo "cp -r $kodidir/lib/kodi/addons/inputstream.adaptive $add_dir"
cp -r "$kodidir"/lib/kodi/addons/inputstream.adaptive "$add_dir"

echo "make clean"
make clean

echo "la messa è finita, andate in pace."
