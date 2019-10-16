#!/bin/sh

#+TODO: Fix the adding line to the file.

if ! grep -qF '"Tapping" "on"' /usr/share/X11/xorg.conf.d/40-libinput.conf; then
  sudo sed -i '/Identifier.*touchpad/Option "Tapping" "on"'\ &&
  echo 'Touchpad tapping option activated.'
else
  echo '!   Touchpad tapping option is already activated'
fi



