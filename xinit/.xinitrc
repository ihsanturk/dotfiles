#!/bin/sh

xrandr --auto

setxkbmap -layout gb
xmodmap ~/.Xmodmap
xbindkeys
xset r rate 190 40
feh --bg-fill ~/Picture/SolarizedMathTree.png

exec slstatus &!
exec dwm 2>/tmp/dwm.log
