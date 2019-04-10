#!/bin/sh

newname="$(echo $1 | awk -F '/' '{printf $NF}')"
echo $newname

python -m blur_image -i "$1" -o "$HOME/Pictures/walls/blurred/$newname"
wal -i "$HOME/Pictures/walls/blurred/$newname"

echo -e "\e[1;32;40mDONE\e[1;33m\nhow do you feel now \e[3;36;40m:)\e[0m"
