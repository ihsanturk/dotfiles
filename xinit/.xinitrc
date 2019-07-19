#!/bin/sh

xrandr --auto

setxkbmap -layout gb
xmodmap .Xmodmap
xbindkeys
xset r rate 220 30

exec slstatus &!
exec dwm 2>/tmp/dwm.log
