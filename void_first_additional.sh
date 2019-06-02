#!/bin/sh

## Packages
# sudo xbps-install\
# 	git\
# 	zsh\
# 	nnn\
# 	fzf\
# 	mpv\
# 	stow\
# 	xset\
# 	dmenu\
# 	xclip\
# 	hdparm\
# 	neovim\
# 	ntfs-3g\
#   usbmuxd\
# 	chromium\
# 	setxkbmap\
# 	youtube-dl\
# 	alsa-utils\
# 	libao-devel\
# 	libX11-devel\
# 	libXft-devel\
# 	ncurses-devel\
# 	portmidi-devel\
#   libimobiledevice\
# 	libXinerama-devel\
# 	the_silver_searcher

# cd /home/ihsn; git clone https://github.com/ihsanturk/dotfiles

# mkdir -p /home/ihsn/sof && cd /home/ihsn/sof
# git clone https://github.com/ihsanturk/dwm && cd dwm && sudo make clean install

# cd /home/ihsn/sof
# git clone https://github.com/ihsanturk/st && cd st && sudo make clean install

SSID=""
USERNAME=""
PSK=""

## Activate touchpad tapping
# sudo sed -i '/Identifier.*touchpad/aOption "Tapping" "on"' /usr/share/X11/xorg.conf.d/40-libinput.conf

## Set up network
# wpa_passphrase $SSID $PSK >> /etc/wpa_supplicant/wpa_supplicant.conf
# killall wpa_supplicant dhcpcd
# wpa_supplicant -B -i wlp2s0 -c /etc/wpa_supplicant/wpa_supplicant.conf
# sleep 5

## Update and install Xorg
# sudo xbps-install -Syuv
# sudo xbps-install xorg-minimal xf86-video-intel git curl base-devel

## Set up Font
# cd /home/$USERNAME && mkdir .fonts && cd .fonts
# curl https://raw.githubusercontent.com/IBM/plex/master/IBM-Plex-Mono/fonts/complete/ttf/IBMPlexMono-Text.ttf -o IBMPlexMono-Text.ttf && fc-cache

## Set default shell zsh
#sudo chsh -s $(which zsh) $USERNAME
#sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
#git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
#git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-completions

## Grub kernel options
# sed -i 's/\(GRUB_CMDLINE_LINUX_DEFAULT=".*\)"/\1 iommu=soft nopti nouveau.modeset=0"/g'\
#/etc/default/grub
# grub-mkconfig -o /boot/grub/grub.cfg
# reboot
