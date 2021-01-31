#!/bin/sh

. ./optional.conf 

if ! [ -d $SoftwarePath/st ]; then
  mkdir -p $SoftwarePath && cd $SoftwarePath &&
  git clone https://git.suckless.org/st &&
  cd $SoftwarePath/st &&
  cd /home/$Username/dotfiles/ &&
  stow st &&
	cd $SoftwarePath/st &&
  make && sudo make clean install &&
	echo 'St has been installed.'
else
  echo 'St has already cloned!'
fi
