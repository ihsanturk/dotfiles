#!/bin/sh

xrandr --auto
sudo rmmod pcspkr

feh --bg-fill ~/Dropbox/Picture/LandscapeDeer.jpg &

sxhkd &
dunst &
dwmbar &

xset r rate 200 50
xmodmap ~/.Xmodmap

compton --config .config/compton/compton.conf &

exec startdwm

