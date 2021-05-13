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

unsetopt EXTENDED_HISTORY
HISTFILE=~/.bash_history

fpath=($fpath "${zsh-autoload}")
autoload -Uz learn
autoload -Uz ls-

# check compinit's cache only once a day.
autoload -Uz compinit
if [ $(date +'%j') != $(/usr/bin/stat -f '%Sm' -t '%j' ${ZDOTDIR:-$HOME}/.zcompdump) ]; then
  compinit
else
  compinit -C
fi

export WORDCHARS='*?_[]~=&;!#$%^(){}'
typeset -U fpath

fignore=lock # do not complete flake.lock files beacuse that slows me down.
