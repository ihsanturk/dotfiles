#!/bin/sh

xrandr --auto
sudo rmmod pcspkr

feh --bg-fill ~/Dropbox/Picture/elijah-o-donnell-Wd-mTu0EKT4-unsplash.jpg &

sxhkd &
dunst &
dwmbar &

setxkbmap gb
xset r rate 200 50
xmodmap ~/.Xmodmap

compton --config .config/compton/compton.conf &

exec startdwm

