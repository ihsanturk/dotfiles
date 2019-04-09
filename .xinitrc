#!/bin/sh

xrandr --setprovideroutputsource modesetting NVIDIA-0
#xrandr --dpi 96
#xrandr --auto

[ -f ~/.Xresources ] && xrdb -merge ~/.Xresources

#exec dwm
#exec bspwm

#exec setxkbmap gb
#exec syndaemon -K -i 0.1 -R -d # When typing disable mouse
#exec setxkbmap -option caps:escape
#exec xcalib -co 85 -b 5 -a    # Filmic Lut effect on the screen. You can restart with "xcalib -clear"
#exec xcompmgr -c
exec i3
