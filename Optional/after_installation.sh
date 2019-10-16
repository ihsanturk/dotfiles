#!/bin/sh

## Set up WiFi
# wpa_passphrase $SSID $PSK >> /etc/wpa_supplicant/wpa_supplicant.conf
# killall wpa_supplicant dhcpcd
# wpa_supplicant -B -i wlp2s0 -c /etc/wpa_supplicant/wpa_supplicant.conf
# sleep 5


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
