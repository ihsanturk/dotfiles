#!/bin/sh

. ./optional.conf 

patches='http://tools.suckless.org/dmenu/patches/fuzzymatch/dmenu-fuzzymatch-4.9.diff'

if ! [ -d $SoftwarePath/dmenu ]; then
  mkdir -p $SoftwarePath && cd $SoftwarePath &&
  git clone https://git.suckless.org/dmenu &&
  cd /home/$Username/dotfiles/ &&
  stow dmenu &&
  cd $SoftwarePath/dmenu && mkdir -p patch && cd patch &&
  eval "set -- $patches" &&
  for p; do
    curl -O -s $p
  done &&
  cd ..
	git apply patch/* &&
	cd $SoftwarePath/dmenu &&
  sed -i '/stest\|else\|fi/d' dmenu_path
  make && sudo make clean install &&
	echo 'Dmenu has been installed.'
else
  echo 'Dmenu has already cloned!'
fi
