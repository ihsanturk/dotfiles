#!/bin/sh

. ./optional.conf 

if ! [ -d /home/$USERNAME/Software/dwm ]; then
  mkdir -p /home/ihsn/Software &&
    cd /home/ihsn/Software &&
    git clone https://git.suckless.com/dwm &&
      cd dwm && mkdir patch &&
      cd patch && curl -O -s 'http://dwm.suckless.org/patches/fullgaps/dwm-fullgaps-6.2.diff' &&
      curl -O -s 'http://dwm.suckless.org/patches/pertag/dwm-pertag-20170513-ceac8c9.diff' &&
	  cd .. && patch < $(pwd)/patch/* &&
	  echo 'Dwm done.'
else
	echo '!    Dwm already cloned'
fi

