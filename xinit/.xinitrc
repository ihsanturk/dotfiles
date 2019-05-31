#!/bin/sh

xrandr --auto

setxkbmap -layout gb -option caps:escape
xset r rate 220

exec dwm 2> /tmp/dwm.log
