export ZSH="/home/ihsan/.oh-my-zsh"
export LANG=en_GB.UTF-8
export SSH_KEY_PATH="~/.ssh/rsa_id"

ZSH_THEME="robbyrussell"
#ZSH_THEME="agnoster"

plugins=(
    git 
    vi-mode
)

#=== sources ===#
source "$HOME/.vim/pack/default/start/gruvbox/gruvbox_256palette.sh"
source "$HOME/.inputrc"
source $ZSH/oh-my-zsh.sh
source $HOME/.aliases

#=== PATHs ===#
export PATH="$PATH:$(du "$HOME/.scripts/" | cut -f2 | tr '\n' ':' | sed 's/:*$//')"
export PYTHONPATH="${PYTHONPATH}:$(du "/media/d/softwares/my_creation/useful_python/" | cut -f2 | tr '\n' ':' | sed 's/:*$//')"
export CUDA_HOME=/opt/cuda
export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/opt/cuda/lib64"
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python
export PKG_CONFIG_PATH=":/usr/lib/pkgconfig:/usr/lib64/pkgconfig"

#=== default apps ===#
export BROWSER="google-chrome-stable"
export SHELL="/bin/zsh"
export TERMINAL="urxvt"
export READER="mupdf"
export EDITOR="vim"
export VISUAL="vim"

#=== options ===#
export FZF_DEFAULT_OPTS="--height 50% --layout=reverse --preview 'head -75 {}'"
export LC_CTYPE=en_GB.UTF-8
export LANG=en_GB.UTF-8
export KEYTIMEOUT=1

man() {
    env \
        LESS_TERMCAP_mb=$(printf "\e[1;31m") \
        LESS_TERMCAP_md=$(printf "\e[1;33m") \
        LESS_TERMCAP_me=$(printf "\e[2;35m") \
        LESS_TERMCAP_se=$(printf "\e[0m") \
        LESS_TERMCAP_so=$(printf "\e[6;31;47m") \
        LESS_TERMCAP_ue=$(printf "\e[0;36m") \
        LESS_TERMCAP_us=$(printf "\e[2;33m") \
        man "$@"
}
