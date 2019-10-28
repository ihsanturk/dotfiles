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
	zsh-completions
	zsh-autosuggestions
	zsh-syntax-highlighting
)

autoload -U compinit && compinit

export KEYTIMEOUT=1
export EDITOR='emacsclient'
export ZSH="$HOME/.oh-my-zsh"
export GTK_THEME="Mojave-dark"
export TERMINFO=/usr/lib/terminfo
export FZF_DEFAULT_COMMAND="find -L"

export PATH="$HOME/.local/bin:$PATH"
export PATH="/usr/local/opt/m4/bin:$PATH"
export PATH="/usr/local/opt/sqlite/bin:$PATH"
export PATH="$HOME/.gem/ruby/2.5.0/bin:$PATH"
export PATH="/usr/local/bin/:/usr/local/sbin:$PATH"

export PKG_CONFIG_PATH="/lib/pkgconfig:/usr/lib/pkgconfig:/usr/local/lib/pkgconfig"
## Wayland Mozilla
#export MOZ_ENABLE_WAYLAND=1
export XKB_DEFAULT_LAYOUT=gb
export XKB_DEFAULT_OPTIONS=caps:escape

source ${HOME}/.func
source ${HOME}/.alias
source ${HOME}/.profile
source $ZSH/oh-my-zsh.sh


