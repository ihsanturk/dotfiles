#!/bin/sh

xrandr --setprovideroutputsource modesetting NVIDIA-0
#xrandr --dpi 96
#xrandr --auto

[ -f ~/.Xresources ] && xrdb -merge ~/.Xresources

#exec chromium
#exec st
exec dwm
#exec bspwm
#exec i3
