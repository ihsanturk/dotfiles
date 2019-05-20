#!/bin/sh

xrandr --auto

setxkbmap -layout gb -option caps:escape

exec dwm 2> /tmp/dwm.log
