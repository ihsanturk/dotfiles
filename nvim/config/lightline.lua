vim.g.lightline = {
	colorscheme = 'gruvbox',
	active = {
		left = { { 'mode', 'paste' }, { 'fugitive', 'relativepath' } },
	},
	component_function = {
		fugitive = lightline_fugitive, -- FIXME
		relativepath = lightline_relativepath, -- FIXME
	},
}

local function lightline_fugitive()
	if vim.fn.exists('*FugitiveHead') then
		return vim.fn.FugitiveHead()
	end
	return ''
end

local function lightline_relativepath()
	if vim.fn.mode() == 't' then
		return ''
	else
		return vim.fn.expand('%')
	end
end
