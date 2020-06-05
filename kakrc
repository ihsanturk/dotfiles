# Plug 
source "~/.config/kak/plugins/plug.kak/rc/plug.kak"

# # Global clipboard using pbcopy
# hook global NormalKey y|d|c %{ nop %sh{
# 	printf %s "$kak_reg_dquote" | pbcopy
# }}

# Plugins {{{1

plug 'andreyorst/fzf.kak'
map global normal <c-p> ':fzf-mode<ret>'
map global normal <a-f> ':fzf-mode<ret>f'
map global normal <a-b> ':fzf-mode<ret>b'

plug 'https://gitlab.com/FlyingWombat/case.kak'

# }}}

# Settings
set global tabstop 3
set global indentwidth 0  # Use tabs
set-option -add global ui_options ncurses_assistant=none
colorscheme gruvbox

# Aliases
alias global h doc

## Keybindings
# leader c -> open kakrc
map global normal <c-j>     vjj
map global insert <c-b>      <left>
map global insert <c-f>      <right>
map global normal <c-q>     '|fold -sw80<ret>'
map global normal <c-space> ':comment-line<ret>'
map global normal <c-r>     ':source ~/.config/kak/kakrc<ret>'
map global normal <c-S>     '|sortlength'

hook global WinCreate .* %{
	add-highlighter window/ number-lines -relative
	add-highlighter window/ wrap -indent -word
}

hook global BufCreate zshrc %{
	set buffer filetype sh
}

hook global NormalKey 0     %{ execute-keys gh }
hook global InsertKey <a-b> %{ execute-keys <esc>b }
hook global InsertKey <a-f> %{ execute-keys <esc>w }

# hook [-group <group> | -once] <scope> <hook_name> <filtering_regex> <commands>

hook global NormalKey gq            %{ execute-keys |fold -sw80<ret> }
hook global InsertKey <a-backspace> %{ execute-keys <esc>bdi }
