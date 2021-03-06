-- install packer.nvim automatically
local execute = vim.api.nvim_command
local install_path = vim.fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
	execute 'packadd packer.nvim'
end
require('config.packer')
local s = { silent = true }
local n = { noremap = true }
local sn = { silent = true, noremap = true }
local map = vim.api.nvim_set_keymap

require 'plugins'
util = require('custom.util')

vim.cmd('lang en_GB.UTF-8')

vim.wo.colorcolumn    = vim.wo.colorcolumn .. '+' .. 1 -- of textwidth
vim.wo.number         = true
vim.wo.relativenumber = true
vim.wo.signcolumn     = 'number'
vim.wo.wrap           = false

vim.g.loaded_node_provider   = 0
vim.g.loaded_perl_provider   = 0
vim.g.loaded_python_provider = 0
vim.g.loaded_ruby_provider   = 0
vim.g.netrw_banner = 0

vim.bo.textwidth    = 80
vim.o.autoindent    = true
vim.o.expandtab     = false
vim.o.hlsearch      = true
vim.o.ignorecase    = true
vim.o.incsearch     = true
vim.o.mouse         = 'a'
vim.o.shiftwidth    = 3
vim.o.sidescroll    = 0
vim.o.sidescrolloff = 0
vim.o.smartcase     = true
vim.o.syntax        = 'on'
vim.o.tabstop       = 3
vim.o.textwidth     = 80
vim.o.updatetime    = 100

vim.o.formatoptions = 'tcqjrn'
vim.o.listchars = 'tab:┊ ,trail:•,nbsp:+'
vim.o.virtualedit = vim.o.virtualedit .. 'block' -- beyond end of the line

vim.cmd('au FileType nix,python,vim,rust set ts=3 sts=3 sw=3 tw=80 noet')

if vim.fn.has('inccommand') then
	vim.o.inccommand = 'nosplit'
end

-- completion
vim.o.completeopt = 'menuone,noselect,preview'
vim.cmd('autocmd CompleteDone * pclose')

-- appearance

-- -- based on time
-- local light_hour, light_min = 07,30 -- hh:mm       -- light and dark themes for
-- local dark_hour, dark_min   = 17,00 -- hh:mm       -- day and night
-- local now = os.date('%H') * 3600 + os.date('%M') * 60
-- local lower = light_hour * 3600 + light_min * 60
-- local upper = dark_hour * 3600 + dark_min * 60
-- local isdark = not (now >= lower and now <=upper)

-- based on macos preferneces
response = vim.fn.system("defaults read -g AppleInterfaceStyle | tr -d '\n'")
isdark = (response == "Dark") and true or false

if isdark then
	vim.cmd 'color base16-gruvbox-dark-medium'
	vim.o.bg = 'dark'
else
	vim.cmd 'color base16-classic-light'
	vim.o.bg = 'dark' -- light actually
end

vim.cmd [[
function! ChangeColorscheme()
	if system("defaults read -g AppleInterfaceStyle") =~ '^Dark'
		se bg=dark
		color base16-gruvbox-dark-medium
	else
		se bg=dark
		color base16-classic-light
	end
endf
autocmd Signal SIGUSR1 call ChangeColorscheme()
]]
if vim.env.COLORTERM == 'truecolor' then
	vim.o.termguicolors = true
else
	vim.o.termguicolors = false
end
vim.cmd('hi! link ColorColumn Visual')
map('n', '<c-c>', '<c-[>:noh<cr>', sn)

-- sort text-objects " TODO: pluginize-vip
map('n', 'gss',       ':set ep=sort<cr>=', s)
map('n', 'gsr',       ':set ep=sort\\ -R<cr>=', s)
map('n', 'gsl',       ':set ep=sortlength<cr>=', s)
map('x', 'gss',       ':<C-U>set ep=sort<cr>gv=', sn)
map('x', 'gsr',       ':<C-U>set ep=sort\\ -R<cr>gv=', sn)
map('x', 'gsl',       ':<C-U>set ep=sortlength<cr>gv=', sn)
map('n', '<leader>g', ':set ep=gt<cr>=', {})
map('x', '<leader>g', ':<C-U>set ep=gt<cr>gv=', n)
map('n', '<leader>s', ":set ep=tr\\ -s\\ '\\ '<cr>=", {})
map('x', '<leader>s', ":<C-U>set ep=tr\\ -s\\ '\\ '<cr>gv=", n)
-- map('n', '<leader>w', ':exe "!wikipedia ".expand("<cword>")<cr>', {})
-- map('x', '<leader>w', ':!xargs wikipedia 2>/dev/null<cr>', n)
-- map('x', '<leader>s', ':!sozlukgovtr<cr>', n)
-- map('n', '<leader>s', ':exe "!sozlukgovtr ".expand("<cword>")<cr>', n)

-- abbrv
vim.cmd('ia teh the')
vim.cmd('ia treu true')
if vim.fn.exists("*strftime") then
	vim.cmd("ia timestamp <c-r>=strftime('%s')<cr>")
	vim.cmd("ia ts <c-r>=strftime('%s')<cr>")
	vim.cmd("ia today <c-r>=strftime('%Y %b %d')<cr>")
	vim.cmd("ia now <c-r>=strftime('%Y-%m-%d %X')<cr>")
end

-- cpwd -> copy pwd
vim.cmd('cabbrev cpwd let @* = expand("%:p:h")')

-- cd -> tcd
vim.cmd('cabbrev cd tcd')

-- typo
vim.cmd('ca W w')
vim.cmd('ca Q q')
vim.cmd('ca E e')
vim.cmd('ca Wq w')
vim.cmd('ca WQ wq')
vim.cmd('ca Vs vs')
vim.cmd('ca VS vs')
vim.cmd('ca Sp sp')
vim.cmd('ca SP sp')

-- pivot scroll for vim
if vim.fn.has('nvim') == 0 then -- apply just for vim
	map('n','<c-j>','<esc><c-e>j',sn)
	map('n','<c-k>','<esc><c-y>k',sn)
end

-- write and buffer delete/close/kill buffer
vim.cmd('cnorea wbd w\\|:bd')
vim.cmd('cnorea wd w\\|:bd')
vim.cmd('cnorea Wd w\\|:bd')
vim.cmd('cnorea WD w\\|:bd')

-- spaces to tabs
vim.cmd('cabbrev s2t s/  /\t/g')
vim.cmd('cabbrev s4t s/    /\t/g')
vim.cmd('cabbrev s8t s/        /\t/g')

-- word search
map('n', 'g/', '/\\<\\><left><left><c-r>/<cr>', n)

-- fucking annoying <c-c> sql completion
vim.g.omni_sql_no_default_maps = 1

util.unixexe('mv')
util.unixexe('rm')
util.unixexe('open')
util.unixexe('mkdir')
util.cnoreapattern('learn', 'tcd '..vim.env.DIR_LEARN..'/', '^learn$') --use: C-]
util.cnoreapattern('code', 'tcd '..vim.env.DIR_CODE..'/', '^code$') --use: C-]

