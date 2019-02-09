export PATH="$PATH:$(du "$HOME/.scripts/" | cut -f2 | tr '\n' ':')"

export EDITOR="vim"
export TERMINAL="urxvt"
export BROWSER="qutebrowser"
export SHELL="/bin/bash"
export READER="mupdf"

export LANG=en_GB.UTF-8
export LC_CTYPE=en_GB.UTF-8

[ -n "$BASH" ] && [ -f ~/.bashrc ] && . ~/.bashrc

# if [[ "$(tty)" = "/dev/tty1" ]]; then
# 	pgrep i3 || startx
# fi
