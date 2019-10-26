#!/bin/sh

xrandr --auto
sudo rmmod pcspkr

feh --bg-fill ~/Dropbox/Picture/LandscapeDeer.jpg &

sxhkd &
dunst &
dwmbar &

xset r rate 220 40
xmodmap ~/.Xmodmap

compton --config .config/compton/compton.conf &

exec dwm 2>/tmp/dwm.log

