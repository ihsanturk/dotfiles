#!/bin/sh

xrandr --auto

feh --bg-fill ~/.cache/wall.jpg &

sxhkd &
dunst &
dwmbar &

xset r rate 220 40
xmodmap -e 'keycode 66 = Escape'
xmodmap -e 'clear Lock'

exec dwm 2>/tmp/dwm.log
