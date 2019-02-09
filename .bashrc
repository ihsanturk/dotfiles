#!/bin/bash

# If not running interactively, don't do anything
[[ $- != *i* ]] && return


#=== PS1 ===#
export PS1="\[$(tput bold)\]\[$(tput setaf 8)\][\[$(tput setaf 3)\]\[$(tput setaf 2)\]\[$(tput setaf 4)\]\\[$(tput setaf 5)\]\w\[$(tput setaf 8)\]]\[$(tput setaf 7)\]\\$ \[$(tput sgr0)\]"


#=== paths ===#
export PATH=~/.scripts:$PATH
export PYTHONPATH="${PYTHONPATH}:/media/d/softwares/my_creation/useful_python"
export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/opt/cuda/lib64"
export CUDA_HOME=/opt/cuda


#=== default apps ===# 
export VISUAL="vim"
export EDITOR="vim"
export BROWSER="qutebrowser"


#=== colors ===#
#source "$HOME/.vim/pack/default/start/gruvbox/gruvbox_256palette.sh"

man() {
    env \
        LESS_TERMCAP_mb=$(printf "\e[1;33m") \
        LESS_TERMCAP_md=$(printf "\e[1;33m") \
        LESS_TERMCAP_me=$(printf "\e[0m") \
        LESS_TERMCAP_se=$(printf "\e[0m") \
        LESS_TERMCAP_so=$(printf "\e[2;43;30m") \
        LESS_TERMCAP_ue=$(printf "\e[0m") \
        LESS_TERMCAP_us=$(printf "\e[1;33m") \
        man "$@"
}


#=== shopt ===#
shopt -s checkwinsize
#shopt -s cdable_vars


#=== history ===#
HISTSIZE= 		#infinite
HISTFILESIZE= 	#infinite
LESSHISTFILE=-


#=== custom aliases ===#
if [ -f ~/.bash_aliases ]; then
	. ~/.bash_aliases
fi


#=== auto completion ===#
if ! shopt -oq posix; then
	if [ -f /usr/share/bash-completion/bash_completion ]; then
		. /usr/share/bash-completion/bash_completion
	elif [ -f /etc/bash_completion ]; then
		. /etc/bash_completion
	fi
fi


#=== default directory ===#
#cd ~

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/media/d/softwares/google-cloud-sdk/google-cloud-sdk/path.bash.inc' ]; then . '/media/d/softwares/google-cloud-sdk/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/media/d/softwares/google-cloud-sdk/google-cloud-sdk/completion.bash.inc' ]; then . '/media/d/softwares/google-cloud-sdk/google-cloud-sdk/completion.bash.inc'; fi
