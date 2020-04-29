#!/bin/bash

## Set default shell zsh
# sudo pacman -S zsh
#sudo chsh -s $(which zsh) $USERNAME
#sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-completions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

#Fzf-zsh
git clone https://github.com/junegunn/fzf.git ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/fzf
${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/fzf/install --bin
git clone https://github.com/Treri/fzf-zsh.git ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/fzf-zsh
