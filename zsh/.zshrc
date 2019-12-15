#
# ~/.zshrc
#

CASE_SENSITIVE="false"
DISABLE_UPDATE_PROMPT="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"
LESSHISTFILE=-
HISTSIZE=9000000
SAVEHIST=9000000
HISTFILE=~/.zsh_history

autoload -U compinit && compinit

set -o emacs
unset LSCOLORS
export CLICOLOR=1
export CLICOLOR_FORCE=1
export KEYTIMEOUT=1
export EDITOR='nvim'
export VISUAL='nvim'
export GOPATH="${HOME}/go"
export SSLKEYLOGFILE="${HOME}/SSLKeyLogFile"
export LDFLAGS="-L/usr/local/opt/llvm/lib"
export LDFLAGS="-L/usr/local/opt/openblas/lib"
export CPPFLAGS="-I/usr/local/opt/openblas/include"
export CPPFLAGS="-I/usr/local/opt/llvm/include"
export PATH="$GOPATH/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="/usr/local/opt/m4/bin:$PATH"
export PATH="/usr/local/opt/llvm/bin:$PATH"
export PATH="/usr/local/opt/sqlite/bin:$PATH"
export PATH="/usr/local/bin:/usr/local/sbin:$PATH"
export PATH=/usr/local/opt/coreutils/libexec/gnubin:$PATH

source ${HOME}/.func
source ${HOME}/.alias
source ${HOME}/.profile
if ! [ -e /usr/local/bin/antibody ]; then
   curl -sfL git.io/antibody | sh -s - -b /usr/local/bin
fi

if ! [ -f ${HOME}/.zsh_plugins.sh ];then
   antibody bundle < ~/.zsh_plugins.txt > ~/.zsh_plugins.sh
fi

source ~/.zsh_plugins.sh



# Forsaken #

# plugins=(
#   z
#   git
#   fzf-zsh
#   zsh-completions
#   zsh-autosuggestions
#   zsh-syntax-highlighting
# )

# export MOZ_ENABLE_WAYLAND=1
# export GDK_BACKEND=wayland
# export CLUTTER_BACKEND=wayland
# export XKB_DEFAULT_LAYOUT=gb
# export XKB_DEFAULT_OPTIONS=caps:escape
# export ZSH="$HOME/.oh-my-zsh"
# export GTK_THEME="Mojave-dark"
# export PATH="$HOME/.gem/ruby/2.5.0/bin:$PATH"
# export PKG_CONFIG_PATH=\
#   "/lib/pkgconfig:/usr/lib/pkgconfig:/usr/local/lib/pkgconfig:$PKG_CONFIG_PATH"
# export PKG_CONFIG_PATH=\
#   "/usr/lib/x86_64-linux-gnu/pkgconfig:/usr/share/pkgconfig:$PKG_CONFIG_PATH"
# export DYLD_FRAMEWORK_PATH=\
#   "/usr/local/opt/csound/Frameworks:$DYLD_FRAMEWORK_PATH"

# source $ZSH/oh-my-zsh.sh
