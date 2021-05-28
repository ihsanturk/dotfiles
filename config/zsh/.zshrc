# Aliases
alias cd-git='cd "$(git rev-parse --show-toplevel)"'
alias e='emacsclient --no-wait'
alias kc='kubectl config current-context'
alias kn='kubectl get nodes -o jsonpath='\''{range .items[*]}{.metadata.name}{"\n"}{end}'\'''
alias kg='kubectl get -o jsonpath='\''{range .items[*]}{.metadata.name}{"\n"}{end}'\'''
alias kcs='kubectl config view -o jsonpath='\''{range .contexts[*]}{.name}{"\n"}{end}'\'''
alias kuc='kubectl config use-context'
alias kubectl='TZ=UTC kubectl'
alias ssh-p='ssh -o PasswordAuthentication=yes -o PubkeyAuthentication=no -o ControlPath=none'
alias ssh-m='ssh -o ControlPath=none'
alias tree='tree -I .git'

# Options (man zshoptions)
setopt NO_FLOW_CONTROL # disable flow control (ctrl-s stop, ctrl-q continue)
setopt RM_STAR_SILENT # do not prompt for confirmation for 'rm path/*'
setopt INTERACTIVE_COMMENTS # allow comment (#) in terminal

# zsh backwards delete word deletes past slashes. I prefer Bash's behavior of stopping at /.
autoload -U select-word-style
select-word-style bash

# History setup
#
# ZDOTDIR is set to a read-only location, set HISTFILE
# This doesn't work from .zshenv
#
# zshell history is saved with multiple sessions. If I open two terminals, A and
# B, run commands in each, then quit A then B, the zshell history file contains
# the previous history, then the new commands from A, then the new commands from
# B.
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE

# Completion setup
# Homebrew (https://docs.brew.sh/Shell-Completion#configuring-completions-in-zsh)
type brew &>/dev/null && fpath=($(brew --prefix)/share/zsh/site-functions $fpath)
# Nix
fpath=(~/.nix-profile/share/zsh/site-functions $fpath)
autoload -Uz compinit
compinit

# Prompt setup

# Enable Git/VCS prompt
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=(precmd_vcs_info)
# Show uncommitted changes
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' formats " %s:%b:%u%c"
setopt PROMPT_SUBST

# Measure command duration (sets _LAST_DURATION)
prompt_duration_start() { _LAST_SECONDS=$SECONDS }
prompt_duration() {
  if [[ -v _LAST_SECONDS ]]; then
    _LAST_DURATION=$((SECONDS - _LAST_SECONDS))
    unset _LAST_SECONDS
  else
    _LAST_DURATION=0
  fi
}
preexec_functions+=(prompt_duration_start)
precmd_functions+=(prompt_duration)

PROMPT='%F{blue}[%T/%?/'\${_LAST_DURATION}'s'\$vcs_info_msg_0_' %~]%f'$'\n$ '

# Emacs vterm setup (must come after prompt setup)
# https://github.com/akermu/emacs-libvterm#directory-tracking-and-prompt-tracking

vterm_printf() {
  if [ -n "$TMUX" ] && ([ "${TERM%%-*}" = "tmux" ] || [ "${TERM%%-*}" = "screen" ] ); then
    # Tell tmux to pass the escape sequences through
    printf "\ePtmux;\e\e]%s\007\e\\" "$1"
  elif [ "${TERM%%-*}" = "screen" ]; then
    # GNU screen (screen, screen-256color, screen-256color-bce)
    printf "\eP\e]%s\007\e\\" "$1"
  else
    printf "\e]%s\e\\" "$1"
  fi
}

vterm_prompt_end() {
  vterm_printf "51;A$(whoami)@$(hostname):$(pwd)";
}
if [[ "$INSIDE_EMACS" == "vterm" ]]; then
  PROMPT=$PROMPT'%{$(vterm_prompt_end)%}'
fi

# Emacs shell setup
if [[ "$INSIDE_EMACS" == *",comint" ]]; then
  # Unsetting ZLE is required to disable terminal echo, which results in the
  # command being printed twice
  unsetopt ZLE
  stty -echo
fi

# ---

# # zshoptions
# setopt NO_FLOW_CONTROL       # disable (ctrl-s stop, ctrl-q continue)
# setopt RM_STAR_SILENT        # do not prompt for confirmation for 'rm path/*'
# setopt INTERACTIVE_COMMENTS  # allow comment (#) in terminal
# 
# source ./alias.sh
# 
# autoload -U select-word-style
# select-word-style bash
# 
# 
# # check compinit's cache only once a day.
# autoload -Uz compinit
# if [ $(date +'%j') != $(/usr/bin/stat -f '%Sm' -t '%j' ${ZDOTDIR:-$HOME}/.zcompdump) ]; then
#   compinit
# else
#   compinit -C
# fi

# ---

# typeset -U path cdpath fpath manpath
# 
# 
# 
# for profile in ${(z)NIX_PROFILES}; do
#   fpath+=($profile/share/zsh/site-functions $profile/share/zsh/$ZSH_VERSION/functions $profile/share/zsh/vendor-completions)
# done
# 
# HELPDIR="/nix/store/78q6iqklpy09dqja8qgzp8cz0fm2i7ka-zsh-5.8/share/zsh/$ZSH_VERSION/help"
# 
# # Use emacs keymap as the default.
# bindkey -e
# 
# 
# 
# 
# 
# 
# 
# 
# # Oh-My-Zsh/Prezto calls compinit during initialization,
# # calling it twice causes slight start up slowdown
# # as all $fpath entries will be traversed again.
# 
# 
# source /nix/store/rncbrs4ad10wvsn4kj4vrd02l6cyf05f-zsh-autosuggestions-0.6.4/share/zsh-autosuggestions/zsh-autosuggestions.zsh
# 
# # Environment variables
# . "/etc/profiles/per-user/ihsan/etc/profile.d/hm-session-vars.sh"
# 
# 
# 
# 
# #
# # Executes commands at the start of an interactive session.
# #
# # Authors:
# #   Sorin Ionescu <sorin.ionescu@gmail.com>
# #
# 
# # Source Prezto.
# if [[ -s "/nix/store/32x5s1lbbqnb42fxvwls6w1c2s06qpzf-zsh-prezto-unstable-2021-01-19/share/zsh-prezto/init.zsh" ]]; then
#   source "/nix/store/32x5s1lbbqnb42fxvwls6w1c2s06qpzf-zsh-prezto-unstable-2021-01-19/share/zsh-prezto/init.zsh"
# fi
# 
# # Customize to your needs...
# 
# 
# 
# 
# # History options should be set in .zshrc and after oh-my-zsh sourcing.
# # See https://github.com/nix-community/home-manager/issues/177.
# HISTSIZE="10000"
# SAVEHIST="10000"
# 
# HISTFILE="$HOME/.zsh_history"
# mkdir -p "$(dirname "$HISTFILE")"
# 
# setopt HIST_FCNTL_LOCK
# setopt HIST_IGNORE_DUPS
# setopt HIST_IGNORE_SPACE
# unsetopt HIST_EXPIRE_DUPS_FIRST
# setopt SHARE_HISTORY
# unsetopt EXTENDED_HISTORY
# 
# 
# x-bash-backward-kill-word() {
# 	WORDCHARS='*?_[]~=&;!#$%^(){}' zle backward-kill-word;
# 	# WORDCHARS='*?_-[]~\!#$%^(){}<>|`@#$%^*()+:?' zle backward-kill-word;
# }
# 
# x-backward-kill-word() {
# 	WORDCHARS='*?_[]~=&;!#$%^(){}' zle backward-kill-word;
# 	# WORDCHARS='/*?_-[]~\!#$%^(){}<>|`@#$%^*()+:?' zle backward-kill-word;
# }
# 
# zle -N x-backward-kill-word
# zle -N x-bash-backward-kill-word
# bindkey '^W' x-bash-backward-kill-word
# 
# zstyle ':completion:*' completer _complete
# zstyle ':completion:*' matcher-list '' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' '+l:|=* r:|=*'
# 
# unsetopt EXTENDED_HISTORY
# # HISTFILE=~/.bash_history
# 
# fpath=($fpath "${zsh-autoload}")
# autoload -Uz learn
# autoload -Uz ls-
# 
# 
# export WORDCHARS='*?_[]~=&;!#$%^(){}'
# typeset -U fpath
# . ~/Sync/private/env
# 
# eval "$(h --setup $DIR_CODE)"
# if [[ $options[zle] = on ]]; then
#   . /nix/store/47rnsz6kaxz381flyqj2qc43aafcprfh-fzf-0.26.0/share/fzf/completion.zsh
#   . /nix/store/47rnsz6kaxz381flyqj2qc43aafcprfh-fzf-0.26.0/share/fzf/key-bindings.zsh
# fi
# 
# . /nix/store/bk6li0h0d8v82yjryp06gjsvpr8ihiwp-autojump-22.5.3/share/autojump/autojump.zsh
# 
# 
# # Aliases
# alias ..='cd ..'
# alias ...='cd ..; cd ..'
# alias E='$EDITOR'
# alias aco='ansicolor'
# alias c='cd'
# alias cat='bat'
# alias cd..='cd ..'
# alias cpwd='pwd | pbcopy'
# alias e='$EDITOR'
# alias eitx='exit'
# alias eix='exit'
# alias eixt='exit'
# alias exi='exit'
# alias exti='exit'
# alias find-executables='find . -perm +111 -type f'
# alias g='git'
# alias ga='git add'
# alias gb='git branch'
# alias gc='git commit -v'
# alias gcl='git clone'
# alias gd='git diff'
# alias gl='git log'
# alias gp='git push -u'
# alias grep='grep --color=auto'
# alias gs='git status -s'
# alias gti='git'
# alias iext='exit'
# alias ixet='exit'
# alias l='exa'
# alias la='ls -a'
# alias les='less'
# alias ll='exa -l'
# alias ls='exa'
# alias ls-l='exa -l'
# alias lsd='exa -D'
# alias mp3='youtube-dl -x --audio-format mp3'
# alias mv='mv -n'
# alias pup='pup -p'
# alias q='exit'
# alias rm='trash'
# alias rtee='tree'
# alias sl='exa'
# alias t='tweet'
# alias ta='tmux new-session -ADs main'
# alias teixt='exit'
# alias ter='tree'
# alias timestamp='date +%s'
# alias tp='todaysplan'
# alias tre='tree'
# alias ts='date +%s'
# alias xeit='exit'
# 
# # Global Aliases
# 
# 
# # Named Directory Hashes
# 
