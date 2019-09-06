#!/bin/sh

xrandr --auto

xrdb .Xresources
xset r rate 220 40
xmodmap -e 'clear Lock' &
xmodmap -e 'keycode 66 = Escape' &
feh --bg-fill ~/.cache/wall.jpg &

sxhkd &
dunst &
dwmbar &

exec dwm 2>/tmp/dwm.log
