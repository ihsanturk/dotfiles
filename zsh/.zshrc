#
# ~/.zshrc
#

LESSHISTFILE=-
HISTSIZE=9000000
SAVEHIST=9000000
HISTFILE=~/.zsh_history

zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' '+l:|=* r:|=*'
autoload -U compinit && compinit

set -o emacs
unset LSCOLORS
export CLICOLOR=1
export CLICOLOR_FORCE=1
export KEYTIMEOUT=1
export EDITOR='nvim'
export VISUAL='nvim'
export GOPATH="$HOME/go"
export NEO4J_PASSWORD="asn"
export SSLKEYLOGFILE="$HOME/SSLKeyLogFile"
export LDFLAGS="-L/usr/local/opt/llvm/lib"
export LDFLAGS="-L/usr/local/opt/openblas/lib"
export CPPFLAGS="-I/usr/local/opt/openblas/include"
export CPPFLAGS="-I/usr/local/opt/llvm/include"
export PATH="$GOPATH/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="/usr/local/opt/m4/bin:$PATH"
export PATH="/usr/local/opt/llvm/bin:$PATH"
export PATH="/usr/local/opt/sqlite/bin:$PATH"
export PATH="/usr/local/bin:/usr/local/sbin:$PATH"
export PATH=/usr/local/opt/coreutils/libexec/gnubin:$PATH

source $HOME/.func
source $HOME/.alias
source $HOME/.profile

if ! [ -e /usr/local/bin/antibody ]; then
   curl -sfL git.io/antibody | sh -s - -b /usr/local/bin
fi

source <(antibody init)
antibody bundle < ~/.zsh_plugins.txt
