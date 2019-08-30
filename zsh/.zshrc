#
# ~/.zshrc
#

ZSH_THEME="robbyrussell"
DISABLE_UPDATE_PROMPT="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"

LESSHISTFILE=-
HISTSIZE=5000000
SAVEHIST=5000000
HISTFILE=~/.zsh_history

plugins=(
	git
	vi-mode
	zsh-completions
	zsh-syntax-highlighting
)

autoload -U compinit && compinit

export EDITOR=vim
export KEYTIMEOUT=1
export ZSH="$HOME/.oh-my-zsh"
export PATH="/usr/local/opt/sqlite/bin:$PATH"
export PATH="/Users/ihsn/Library/Python/3.7/bin:/usr/local/bin/:/usr/local/sbin:$PATH"
export PKG_CONFIG_PATH="/lib/pkgconfig:/usr/lib/pkgconfig:/usr/local/lib/pkgconfig"
export PATH="$PATH:$(du "${HOME}/Software/Personal/Useful/" | cut -f2 | grep -v '\.git' | tr '\n' ':' | sed 's/:*$//')"
export PATH="/usr/local/opt/m4/bin:$PATH"

source ${HOME}/.func
source ${HOME}/.alias
source ${HOME}/.profile
source $ZSH/oh-my-zsh.sh
