#!/bin/sh

xrandr --setprovideroutputsource modesetting NVIDIA-0
#xrandr --dpi 96
xrandr --auto

[ -f ~/.Xresources ] && xrdb -merge ~/.Xresources

exec i3
#exec dwm
#exec bspwm
exec syndaemon -K -i 0.2 -R -d # When typing disable mouse
exec sudo mount /dev/sdb1 /media/d/
#exec xcalib -co 80 -b 10 -a    # Filmic Lut effect on the screen
## You can restart with "xcalib -clear"
