#
# ~/.zshrc
#

# Oh-My-Zsh
ZSH_THEME="robbyrussell"
export ZSH="$HOME/.oh-my-zsh"
plugins=(
	z
	git
	zsh-completions
	zsh-autosuggestions
	zsh-syntax-highlighting
)

LESSHISTFILE=-
HISTSIZE=9000000
SAVEHIST=9000000
HISTFILE=~/.zsh_history

zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' '+l:|=* r:|=*'
fpath=(~/.zsh/completions $fpath)
autoload -U compinit && compinit

setopt hist_ignore_dups
setopt auto_menu

set -o emacs
unset LSCOLORS
export CLICOLOR=1
export KEYTIMEOUT=1
export EDITOR='nvim'
export VISUAL='nvim'
export MYSQL_PWD=root
export CLICOLOR_FORCE=1
export GIN_MODE=release
export GOPATH="$HOME/go"
export PATH="$GOPATH/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export ZPLUG_HOME=/usr/local/opt/zplug
export PATH="/usr/local/opt/m4/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/llvm/lib"
export SSLKEYLOGFILE="$HOME/SSLKeyLogFile"
export PATH="/usr/local/opt/llvm/bin:$PATH"
export PATH="/usr/local/opt/sqlite/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/openblas/lib"
export CPPFLAGS="-I/usr/local/opt/llvm/include"
export PATH="$HOME/Library/Python/3.7/bin:$PATH"
export PATH="/usr/local/bin:/usr/local/sbin:$PATH"
export CPPFLAGS="-I/usr/local/opt/openblas/include"
export PATH=/usr/local/opt/coreutils/libexec/gnubin:$PATH

source $HOME/.func
source $HOME/.alias
source $HOME/.profile
source $HOME/.abbrev.zsh
source $ZPLUG_HOME/init.zsh
source $HOME/.secret.credentials
source $ZSH/oh-my-zsh.sh # Should be the last line
export PATH="/usr/local/opt/protobuf@3.7/bin:$PATH"
