#!/bin/sh

. ./optional.conf 

if ! [ -d /home/$USERNAME/Software/st ]; then
  mkdir -p /home/ihsn/Software &&
    cd /home/ihsn/Software &&
    git clone https://git.suckless.com/st &&
	  echo 'St done.'
else
	echo '!    St already cloned'
fi
