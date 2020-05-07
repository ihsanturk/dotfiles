#!/bin/sh

export CLICOLOR=1
export KEYTIMEOUT=1
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
export CPPFLAGS="-I/usr/local/opt/llvm/include"
export CPPFLAGS="-I/usr/local/opt/openblas/include"
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'
export FZF_CTRL_R_OPTS="--height 0% --preview 'echo {}' --preview-window down:3:hidden:wrap --bind '?:toggle-preview'"

export PATH=$GOPATH/bin:$PATH
export PATH=$HOME/.cargo/bin:$PATH
export PATH=$HOME/.local/bin:$PATH
export PATH=$VULKAN_SDK/bin$:$PATH
export PATH=/usr/local/opt/bc/bin:$PATH
export PATH=/usr/local/opt/m4/bin:$PATH
export PATH=/usr/local/opt/llvm/bin:$PATH
export PATH=/usr/local/opt/ruby/bin:$PATH
export PATH=/usr/local/opt/sqlite/bin:$PATH
export PATH=$HOME/.local/helper-scripts:$PATH
export PATH=$HOME/Library/Python/3.7/bin:$PATH
export PATH=/usr/local/bin:/usr/local/sbin:$PATH
export PATH=/usr/local/opt/protobuf@3.7/bin:$PATH
export PATH=/usr/local/lib/ruby/gems/2.7.0/bin:$PATH
export PATH=/usr/local/opt/coreutils/libexec/gnubin:$PATH

# Nodejs
VERSION=v12.13.1
DISTRO=linux-x64
export PATH=/usr/local/lib/nodejs/node-$VERSION-$DISTRO/bin:$PATH

