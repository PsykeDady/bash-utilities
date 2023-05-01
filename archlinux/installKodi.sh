#!/bin/bash

echo "Installare le dipendenze? [S/n]"
read -r risp

if [[ $risp != "n" && $risp != "N" ]]; then
	# installazione dei pacchetti 
	echo -e 'installazione dei pacchetti'
	sudo pacman -S autoconf automake gettext cmake  curl jre-openjdk gawk gcc flatbuffers gdc  gperf alsa-lib libass avahi   libbluray bluez-utils bzip2 libcdio libcec p8-platform  libcrossguid libcurl-compat libcurl-gnutls dbus-c++ libdbusmenu-glib libglvnd flac fontconfig fmt  freetype2 fribidi fstrm libgcrypt giflib glew  glu gnutls  libgpg-error  gtest libisofs  libjpeg-turbo  lcms2 lirc lzo libmicrohttpd mariadb-libs libnfs     libogg  libomxil-bellagio pcre libplist  libpng  libpulse  shairplay  smbclient  spdlog sqlite taglib libtaginfo  libtiff  tinyxml  libtool  libudev0-shim libva libva1 libva-utils    libvdpau  libvorbis  libxkbcommon  libxmu  libxrandr  libxslt  libxt   wipe  lsb-release  meson  nasm  ninja  rapidjson swig  unzip  yasm  zip  zlib rapidjson swig shairplay

	echo -e "\n" 'Scarico e compilo fstrcmp da AUR'
	if [[ -e fstrcmp ]]; then sudo rm -rf fstrcmp; fi
	git clone https://aur.archlinux.org/fstrcmp.git 
	cd fstrcmp || return 255
	makepkg -si -A

	cd ..
fi
nomedir="xbmc"
if [[ -e  xbmc ]]; then 
	echo -e "\n\nEsiste una versione precedente del progetto, spostare i file esistenti (s) oppure scaricare il repo in una cartella diversa (N) ?"
	read -r risp
	if [[ $risp == "S" || $risp == "s" ]];then 
		echo -e "\n mv xbmc xbmc.old"
		sudo rm -rf xbmc.old
		mv xbmc xbmc.old
		
		echo -e "\n" 'git clone https://github.com/xbmc/xbmc.git'
		git clone https://github.com/xbmc/xbmc.git
	else 
		nomedir=xbmc-$(date +"%Y%m%d")
		seq=0;
		while [[ -e $nomedir""$tmp ]]; do 
			seq=$((seq+1));
			tmp="-$seq"
			echo "tentativo con"  "$nomedir"""$tmp;
		done;
		nomedir=$nomedir""$tmp;
		echo -e "\n" 'git clone https://github.com/xbmc/xbmc.git' "$nomedir"
		git clone https://github.com/xbmc/xbmc.git "$nomedir"
	fi
else 
	echo -e "\n" 'git clone https://github.com/xbmc/xbmc.git'
	git clone https://github.com/xbmc/xbmc.git

fi





echo -e  "\n cd $nomedir"
cd "$nomedir" || return 255


echo "Installare la versione di sviluppo? [s/N]"
read -r risp

if [[ $risp != "s" && $risp != "S" ]]; then
	echo -e  "\n" 'git checkout -b Matrix origin/Matrix'
	git checkout -b Matrix origin/Matrix
fi


echo -e  "\n" 'sudo make -C tools/depends/target/crossguid PREFIX=/usr/local'
sudo make -C tools/depends/target/crossguid PREFIX=/usr/local

echo -e  "\n" 'sudo make -C tools/depends/target/flatbuffers PREFIX=/usr/local'
sudo make -C tools/depends/target/flatbuffers PREFIX=/usr/local

echo -e  "\n" 'sudo make -C tools/depends/target/libfmt PREFIX=/usr/local'
sudo make -C tools/depends/target/libfmt PREFIX=/usr/local


echo -e  "\n" 'sudo make -C tools/depends/target/libspdlog PREFIX=/usr/local'
sudo make -C tools/depends/target/libspdlog PREFIX=/usr/local

echo -e  "\n" 'creazione ed ingresso nella directory di build'
mkdir kodi-build && { cd kodi-build || return 255; } 

echo -e "\n$PWD\n\n"

echo -e  "\n" 'cmake 1'
cmake "$PWD"/.. -DCMAKE_INSTALL_PREFIX=/usr/local -DCORE_PLATFORM_NAME=x11 -DAPP_RENDER_SYSTEM=gl


cmake --build . -- VERBOSE=1 -j"$(getconf _NPROCESSORS_ONLN)"


