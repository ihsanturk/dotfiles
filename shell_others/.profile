#!/bin/sh

export PS1="`tput bold;tput setaf 2`➜`tput setaf 3`  %1~`tput sgr0` "
export PROMPT="`tput bold;tput setaf 2`➜`tput setaf 3`  %1~`tput sgr0` "

export BLPAPI_ROOT="/home/ihsn/API/blpapi_cpp_3.12.3.1"
export VULKAN_ROOT_LOCATION="$HOME/Software/Library/"
export VULKAN_SDK_VERSION="1.1.114.0"
export VULKAN_SDK="$VULKAN_ROOT_LOCATION/vulkansdk-macos-$VULKAN_SDK_VERSION/macOS"
export VK_ICD_FILENAMES="$VULKAN_SDK/etc/vulkan/icd.d/MoltenVK_icd.json"
export VK_LAYER_PATH="$VULKAN_SDK/etc/vulkan/explicit_layers.d"

export CLICOLOR=1
export KEYTIMEOUT=1
export MYSQL_PWD=root
export CLICOLOR_FORCE=1
export GIN_MODE=release
export LANG=en_GB.UTF-8
export GOPATH="$HOME/go"
export LC_ALL=en_GB.UTF-8
export MOZ_ENABLE_WAYLAND=1
export EDITOR='nvr --remote-wait'
export VISUAL='nvr --remote-wait'
export FZF_ALT_C_OPTS="--height 5%"
export ZPLUG_HOME=/usr/local/opt/zplug
export LDFLAGS="-L/usr/local/opt/llvm/lib"
export SSLKEYLOGFILE="$HOME/SSLKeyLogFile"
export LDFLAGS="-L/usr/local/opt/openblas/lib"
export NVIM_LISTENADDRESS=/tmp/nvimsocket nvim
export CPPFLAGS="-I/usr/local/opt/llvm/include"
export CPPFLAGS="-I/usr/local/opt/openblas/include"
export FZF_CTRL_R_OPTS="--height 0% --preview 'echo {}' --preview-window down:3:hidden:wrap --bind '?:toggle-preview'"

export PATH="$GOPATH/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$VULKAN_SDK/bin$:$PATH"
export PATH="/usr/local/opt/m4/bin:$PATH"
export PATH="/usr/local/opt/llvm/bin:$PATH"
export PATH="/usr/local/opt/ruby/bin:$PATH"
export PATH="/usr/local/opt/sqlite/bin:$PATH"
export PATH="$HOME/Library/Python/3.7/bin:$PATH"
export PATH="/usr/local/bin:/usr/local/sbin:$PATH"
export PATH="/usr/local/opt/protobuf@3.7/bin:$PATH"
export PATH="/usr/local/lib/ruby/gems/2.7.0/bin:$PATH"
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"

export LESSHISTFILE=-
export HISTSIZE=
export SAVEHIST=9000000
export HISTFILESIZE=
export LESSHISTFILE=-
export HISTFILE=~/.zsh_history

# Nodejs
VERSION=v12.13.1
DISTRO=linux-x64
export PATH=/usr/local/lib/nodejs/node-$VERSION-$DISTRO/bin:$PATH
