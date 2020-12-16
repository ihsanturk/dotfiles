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

autoload -Uz compinit && compinit
export WORDCHARS='*?_[]~=&;!#$%^(){}'
