-- install packer.nvim automatically
local execute = vim.api.nvim_command
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
	execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
	execute 'packadd packer.nvim'
end

local s = { silent = true }
local n = { noremap = true }
local sn = { silent = true, noremap = true }
local map = fn.nvim_set_keymap

require 'plugins'

vim.wo.wrap           = false
vim.wo.number         = true
vim.wo.signcolumn     = 'number'
vim.wo.relativenumber = true
vim.wo.colorcolumn    = vim.wo.colorcolumn .. '+' .. 1 -- of textwidth

vim.g.loaded_node_provider   = 0
vim.g.loaded_perl_provider   = 0
vim.g.loaded_python_provider = 0
vim.g.loaded_ruby_provider   = 0

vim.bo.textwidth = 79
vim.o.autoindent = true
vim.o.expandtab  = false
vim.o.hlsearch   = true
vim.o.ignorecase = true
vim.o.incsearch  = true
vim.o.mouse      = 'a'
vim.o.shiftwidth = 3
vim.o.smartcase  = true
vim.o.syntax     = 'on'
vim.o.tabstop    = 3
vim.o.textwidth  = 79
vim.o.updatetime = 100

vim.o.formatoptions = 'tcqjrn'
vim.o.listchars = 'tab:┊ ,trail:•,nbsp:+'
vim.o.virtualedit = vim.o.virtualedit .. 'block' -- beyond end of the line

vim.cmd('au FileType nix,python,vim,rust set ts=3 sts=3 sw=3 tw=79 noet')

if fn.has('inccommand') then
	vim.o.inccommand = 'nosplit'
end

-- completion
vim.o.completeopt = 'menu,preview'
vim.cmd('autocmd CompleteDone * pclose')

-- appearance
local light_hour = 07; local light_min = 30
local dark_hour = 16; local dark_min = 20
local now = os.date('%H') * 3600 + os.date('%M') * 60
local lower = light_hour * 3600 + light_min * 60
local upper = dark_hour * 3600 + dark_min * 60
if  now >= lower and now <=upper then
	vim.o.bg = 'light'
else
	vim.o.bg = 'dark'
end
if vim.env.COLORTERM == 'truecolor' then
	vim.o.termguicolors = true
	if vim.o.bg == light then
		vim.cmd [[ color solarized8 ]]
	else
		vim.cmd [[ color gruvbox ]]
	end
else
	vim.o.termguicolors = false
	vim.cmd [[ color solarized8 ]]
end
vim.cmd('hi! link ColorColumn Visual')
map('n', '<c-c>', ':noh<cr>', sn)

-- sort text-objects " TODO: pluginize-vip
map('n', 'gss',       ':set ep=sort<cr>=', s)
map('n', 'gsr',       ':set ep=sort\\ -R<cr>=', s)
map('n', 'gsl',       ':set ep=sortlength<cr>=', s)
map('x', 'gss',       ':<C-U>set ep=sort<cr>gv=', sn)
map('x', 'gsr',       ':<C-U>set ep=sort\\ -R<cr>gv=', sn)
map('x', 'gsl',       ':<C-U>set ep=sortlength<cr>gv=', sn)
map('n', '<leader>g', ':set ep=gt<cr>=', {})
map('n', '<leader>w', ':exe "!wikipedia ".expand("<cword>")<cr>', {})
map('x', '<leader>g', ':<C-U>set ep=gt<cr>gv=', n)
map('x', '<leader>w', ':!xargs wikipedia 2>/dev/null<cr>', n)

-- map('x', '<leader>s', ':!sozlukgovtr<cr>', n)
-- map('n', '<leader>s', ':exe "!sozlukgovtr ".expand("<cword>")<cr>', n)

-- abbrv
vim.cmd('ia teh the')
if fn.exists("*strftime") then
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
if fn.has('nvim') == 0 then -- apply just for vim
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

-- external commands
local function CnoreaOnlyPattern(lhs, rhs, pattern)
	vim.api.nvim_command('cnoreabbrev <expr> '..lhs..
		' (getcmdtype() == ":" && getcmdline() =~ "'..pattern..
		'")? "'..rhs..'" : "'..lhs..'"')
end

local function UnixExecutable(name)
	CnoreaOnlyPattern(name, '!'..name, '^'..name..'$')
end

UnixExecutable('mv')
UnixExecutable('rm')
UnixExecutable('open')
UnixExecutable('mkdir')
CnoreaOnlyPattern('learn', 'tcd '..vim.env.DIR_LEARN..'/', '^learn$') --use: C-]

