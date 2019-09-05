#!/bin/sh

xrandr --auto

setxkbmap -layout gb
xmodmap ~/.Xmodmap
xbindkeys
xset r rate 220 40
feh --bg-fill ~/Picture/green.jpg

#exec slstatus &!
exec dwm 2>/tmp/dwm.log
