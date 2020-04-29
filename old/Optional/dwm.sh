#!/bin/sh

. ./optional.conf 

patches='http://dwm.suckless.org/patches/fullgaps/dwm-fullgaps-6.2.diff\
  http://dwm.suckless.org/patches/pertag/dwm-pertag-20170513-ceac8c9.diff'

if ! [ -d $SoftwarePath/dwm ]; then
  mkdir -p $SoftwarePath && cd $SoftwarePath &&
  git clone https://git.suckless.org/dwm &&
  cd $SoftwarePath/dwm && mkdir -p patch && cd patch &&
  eval "set -- $patches" &&
  for p; do
    curl -O -s $p
  done &&
  cd ..
	git apply patch/* &&
  cd /home/$Username/dotfiles/ &&
  stow dwm &&
	cd $SoftwarePath/dwm &&
  make && sudo make clean install &&
	echo 'Dwm has been installed.'
else
  echo 'Dwm has already cloned!'
fi
