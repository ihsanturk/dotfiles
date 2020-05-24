set global tabstop 3
set global indentwidth 0  # Use tabs

colorscheme gruvbox

hook global WinCreate .* %{
	add-highlighter window/ number-lines -relative
	add-highlighter window/ wrap -indent -word
}

hook global BufCreate zshrc %{
	set buffer filetype sh
}

hook global NormalKey 0 %{ execute-keys gh }
hook global InsertKey <c-b> %{ execute-keys <left> }
hook global InsertKey <a-b> %{ execute-keys <esc>bi }
hook global InsertKey <a-f> %{ execute-keys <esc>wi }
hook global InsertKey <c-f> %{ execute-keys <right> }
hook global NormalKey gq %{ execute-keys |fold -sw80<ret> }
hook global InsertKey <a-backspace> %{ execute-keys <esc>bdi }
