# History options should be set in .zshrc and after oh-my-zsh sourcing.
# See https://github.com/nix-community/home-manager/issues/177.
HISTSIZE="10000"
SAVEHIST="10000"
HISTFILE="$HOME/.zsh_history"
mkdir -p "$(dirname "$HISTFILE")"
unsetopt EXTENDED_HISTORY
# HISTFILE=~/.bash_history

# paths
fpath+=$HOME/bin

# zshoptions
setopt HIST_FCNTL_LOCK
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt INTERACTIVE_COMMENTS     # allow comment (#) in terminal
setopt NO_FLOW_CONTROL          # disable (ctrl-s stop, ctrl-q continue)
setopt RM_STAR_SILENT           # do not prompt for confirmation for 'rm path/*'
setopt SHARE_HISTORY
unsetopt EXTENDED_HISTORY
unsetopt HIST_EXPIRE_DUPS_FIRST

. ~/.alias
. ~/Sync/private/env
# . autojump.zsh
# . syntax-higlighter.zsh
# . zsh-autosuggestions-0.6.4

autoload -U select-word-style
select-word-style bash

# pure prompt
fpath+=$HOME/.zsh/pure
autoload -U promptinit; promptinit
prompt pure
zstyle :prompt:pure:git:stash show yes

# check compinit's cache only once a day.
autoload -Uz compinit
if [ $(date +'%j') != $(/usr/bin/stat -f '%Sm' -t '%j' ${ZDOTDIR:-$HOME}/.zcompdump) ]; then
  compinit
else
  compinit -C
fi

# Use emacs keymap as the default.
bindkey -e

x-bash-backward-kill-word() {
	WORDCHARS='*?_[]~=&;!#$%^(){}' zle backward-kill-word;
	# WORDCHARS='*?_-[]~\!#$%^(){}<>|`@#$%^*()+:?' zle backward-kill-word;
}
x-backward-kill-word() {
	WORDCHARS='*?_[]~=&;!#$%^(){}' zle backward-kill-word;
	# WORDCHARS='/*?_-[]~\!#$%^(){}<>|`@#$%^*()+:?' zle backward-kill-word;
}

zle -N x-backward-kill-word
zle -N x-bash-backward-kill-word
bindkey '^W' x-bash-backward-kill-word

zstyle ':completion:*' completer _complete
zstyle ':completion:*' matcher-list '' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' '+l:|=* r:|=*'

export WORDCHARS='*?_[]~=&;!#$%^(){}'
typeset -U path cdpath fpath manpath

