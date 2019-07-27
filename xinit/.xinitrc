#!/bin/sh

xrandr --auto

setxkbmap -layout tr
xbindkeys
xset r rate 220 30

#exec slstatus &!
exec startkde 2>/tmp/dwm.log
