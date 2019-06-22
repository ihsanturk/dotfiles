#!/bin/sh

xrandr --auto

setxkbmap -layout gb
xset r rate 220 30

exec dwm 2>/tmp/dwm.log
