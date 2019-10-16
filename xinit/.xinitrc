#!/bin/sh

xrandr --auto

feh --bg-fill ~/.cache/wall.jpg &

sxhkd &
dunst &
dwmbar &

xset r rate 220 40
xmodmap ~/.Xmodmap

exec dwm 2>/tmp/dwm.log
