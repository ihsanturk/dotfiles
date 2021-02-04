local lualine = require('lualine')
lualine.theme = 'gruvbox'
lualine.sections.lualine_b = { relativepath }

local function relativepath()
	if vim.fn.mode() == 't' then
		return ''
	else
		return vim.fn.expand('%')
	end
end

lualine.status()
