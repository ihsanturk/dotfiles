#!/bin/sh

. ./optional.conf 

DISTRO=$(lsb_release -i | xargs echo | sed 's/Distributor ID: //g')

if [ "$DISTRO" = "Ubuntu" ]; then
  packageManager="apt install";
elif [ "$DISTRO" = "Arch" ]; then
  packageManager="pacman -S";
elif [ "$DISTRO" = "Void" ]; then
  packageManager="xbps-install -S";
else
  echo "OS not recognized!";
  exit 2;
fi

pkgList="\
	git\
	fzf\
	nnn\
	stow\
	curl\
	sxhkd\
	dmenu\
	xclip\
	hdparm\
	neovim\
	usbmuxd\
	chromium\
	xbindkeys\
	libnotify\
	base-devel\
	alsa-utils\
	libX11-devel\
	libXft-devel\
	xorg-minimal\
	xf86-video-intel\
"

echo "$pkgList" | tr ' ' '\n' | while read item; do
   sudo $packageManager $item;
done
