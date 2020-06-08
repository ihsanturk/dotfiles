#!/bin/sh

export LESS='-x4RFsX'
export LESS_TERMCAP_mh=$(tput dim)
export LESS_TERMCAP_mr=$(tput rev)
export LESS_TERMCAP_ZN=$(tput ssubm)
export LESS_TERMCAP_ZO=$(tput ssupm)
export LESS_TERMCAP_ZV=$(tput rsubm)
export LESS_TERMCAP_ZW=$(tput rsupm)
export LESS_TERMCAP_me=$(tput sgr0) # text
export LESS_TERMCAP_se=$(tput rmso; tput sgr0)
export LESS_TERMCAP_mb=$(tput bold; tput setaf 1) # green
export LESS_TERMCAP_md=$(tput bold; tput setaf 3) # titles, args
export LESS_TERMCAP_so=$(tput bold; tput setaf 0; tput setab 6) # END
export LESS_TERMCAP_us=$(tput smul; tput bold; tput setaf 4) # options
export LESS_TERMCAP_ue=$(tput rmul; tput setaf 5) # important parts of text.

export CLICOLOR=1
export KEYTIMEOUT=1
export HISTSIZE=90000
export CLICOLOR_FORCE=1
export GIN_MODE=release
export LANG=en_GB.UTF-8
export GOPATH="$HOME/go"
export LC_ALL=en_GB.UTF-8
export SAVEHIST=$HISTSIZE
export TERM=xterm-256color
export MOZ_ENABLE_WAYLAND=1
export EDITOR='nvr --remote-wait'
export VISUAL='nvr --remote-wait'
export ZSH_AUTOSUGGEST_USE_ASYNC=1
export FZF_ALT_C_OPTS="--height 5%"
export HISTFILE="$HOME/.zsh_history"
export ZPLUG_HOME=/usr/local/opt/zplug
export LDFLAGS="-L/usr/local/opt/llvm/lib"
export RUST_WRAPPER=/usr/local/bin/sccache
export SSLKEYLOGFILE="$HOME/SSLKeyLogFile"
export FZF_DEFAULT_COMMAND='fd -d3 --type f'
export LDFLAGS="-L/usr/local/opt/openblas/lib"
export CPPFLAGS="-I/usr/local/opt/llvm/include"
export CPPFLAGS="-I/usr/local/opt/openblas/include"
export FZF_DEFAULT_OPTS='--ansi --height 50% --layout=reverse --border'
export FZF_CTRL_R_OPTS="--height 10% --preview 'echo {}' --preview-window down:3:hidden:wrap --bind '?:toggle-preview'"

export PATH=$GOPATH/bin:$PATH
export PATH=$HOME/.cargo/bin:$PATH
export PATH=$HOME/.local/bin:$PATH
export PATH=$VULKAN_SDK/bin$:$PATH
export PATH=/usr/local/opt/bc/bin:$PATH
export PATH=/usr/local/opt/m4/bin:$PATH
export PATH=/usr/local/opt/llvm/bin:$PATH
export PATH=/usr/local/opt/ruby/bin:$PATH
export PATH=${HOME}/.nix-profile/bin/:$PATH
export PATH=/usr/local/opt/sqlite/bin:$PATH
export PATH=$HOME/.local/helper-scripts:$PATH
export PATH=$HOME/Library/Python/3.7/bin:$PATH
export PATH=/usr/local/bin:/usr/local/sbin:$PATH
export PATH=/usr/local/opt/protobuf@3.7/bin:$PATH
export PATH=/usr/local/lib/ruby/gems/2.7.0/bin:$PATH
export PATH=/usr/local/opt/coreutils/libexec/gnubin:$PATH
export NIX_PATH=$HOME/.nix-defexpr/channels${NIX_PATH:+:}$NIX_PATH

# Nodejs
VERSION=v12.13.1
DISTRO=linux-x64
export PATH=/usr/local/lib/nodejs/node-$VERSION-$DISTRO/bin:$PATH

