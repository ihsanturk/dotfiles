#!/bin/sh

. ./optional.conf 

##=== Distro Detection ===##

#DISTRO=$(lsb_release -i | xargs echo | sed 's/Distributor ID: //g')
#if [ "$DISTRO" = "Ubuntu" ]; then
#  packageManager="apt install";
#elif [ "$DISTRO" = "Arch" ]; then
#  packageManager="pacman -S";
#elif [ "$DISTRO" = "Void" ]; then
#  packageManager="xbps-install -S";
#else
#  echo "OS not recognized!";
#  exit 2;
#fi

##=== / Distro Detection / ===##

packageManager="pacman -S"
arguments="--noconfirm"

pkgList="\
	fzf\
	nnn\
	zsh\
	mosh\
	stow\
	neovim\
	base-devel\
  python-pip\
"
	#sxhkd\
	#xclip\
	#dmenu\
	#hdparm\
	#usbmuxd\
	#chromium\
	#libnotify\
	#xbindkeys\
	#alsa-utils\
	#libX11-devel\
	#libXft-devel\
	#wl-clipboard\
	#xorg-minimal\
	#translate-shell\
	#xf86-video-intel\

echo "$pkgList" | tr ' ' '\n' | while read item; do
   sudo $packageManager $arguments $item;
done
