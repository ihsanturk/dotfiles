#!/bin/sh

xrandr --auto

setxkbmap -layout gb -option caps:escape
dwmstatus 2>&1 >/dev/null &

exec dwm 2> /tmp/dwm.log
