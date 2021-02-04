local lualine = require('lualine')
lualine.theme = 'gruvbox'

local function relativepath()
	if vim.fn.mode() == 't' then
		return ''
	else
		return vim.fn.expand('%')
	end
end

lualine.sections.lualine_b = { relativepath }
lualine.status()
