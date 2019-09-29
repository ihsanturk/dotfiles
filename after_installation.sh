#!/bin/sh

## Package
#sudo pacman -S git
#sudo pacman -S nnn 
#sudo pacman -S stow 
#sudo pacman -S curl 
#sudo pacman -S dmenu 
#sudo pacman -S xclip 
#sudo pacman -S hdparm 
#sudo pacman -S xbindkeys
#sudo pacman -S libnotify
#sudo pacman -S alsa-utils 
#sudo pacman -S libX11-devel 
#sudo pacman -S libXft-devel 
#sudo pacman -S xorg-minimal 
#sudo pacman -S xf86-video-intel

#sudo pacman -S fzf
#sudo pacman -S mpv
#sudo pacman -S xset
#sudo pacman -S neovim
#sudo pacman -S ntfs-3g
#sudo pacman -S usbmuxd
#sudo pacman -S chromium
#sudo pacman -S base-devel
#sudo pacman -S youtube-dl
#sudo pacman -S libao-devel
#sudo pacman -S ncurses-devel
#sudo pacman -S portmidi-devel
#sudo pacman -S libimobiledevice
#sudo pacman -S libXinerama-devel
#sudo pacman -S the_silver_searcher


# mkdir -p /home/ihsn/Software &&
#   cd /home/ihsn/Software &&
#     git clone https://git.suckless.com/dwm && cd dwm && mkdir patch &&
#       cd patch && curl -O -s 'http://dwm.suckless.org/patches/fullgaps/dwm-fullgaps-6.2.diff' &&
#       curl -O -s 'http://dwm.suckless.org/patches/pertag/dwm-pertag-20170513-ceac8c9.diff'

#     git clone https://git.suckless.org/st


#PSK=""
#SSID=""
#USERNAME="ihsn"


## Activate touchpad tapping for Xorg
# sudo sed -i '/Identifier.*touchpad/aOption "Tapping" "on"'\
#	/usr/share/X11/xorg.conf.d/40-libinput.conf


## Set up WiFi
# wpa_passphrase $SSID $PSK >> /etc/wpa_supplicant/wpa_supplicant.conf
# killall wpa_supplicant dhcpcd
# wpa_supplicant -B -i wlp2s0 -c /etc/wpa_supplicant/wpa_supplicant.conf
# sleep 5


## Update and install Xorg
# sudo xbps-install -Syuv
# sudo xbps-install xorg-minimal xf86-video-intel curl base-devel


## Set up IBM-Plex Font
# cd /home/$USERNAME && mkdir .fonts && cd .fonts &&
# curl https://raw.githubusercontent.com/IBM/plex/master/IBM-Plex-Mono/fonts/complete/ttf/IBMPlexMono-Text.ttf -o IBMPlexMono-Text.ttf &&
#   fc-cache


## Set default shell zsh
# sudo pacman -S zsh
# sudo chsh -s $(which zsh) $USERNAME
# sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
# git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
# git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-completions
# git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions


## Grub kernel options for void linux
# sed -i 's/\(GRUB_CMDLINE_LINUX_DEFAULT=".*\)"/\1 iommu=soft nopti nouveau.modeset=0"/g'\
# /etc/default/grub
# grub-mkconfig -o /boot/grub/grub.cfg
## reboot
