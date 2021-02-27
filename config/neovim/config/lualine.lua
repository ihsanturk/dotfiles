local lualine = require('lualine')
-- lualine.theme = 'gruvbox'

local function relativepath()
	if vim.fn.mode() == 't' then
		return '' -- hide filename in terminal buffers
	else
		return vim.fn.expand('%')
	end
end

lualine.sections = {
  lualine_a = { 'mode' },
  lualine_b = { 'branch' },
  lualine_c = { relativepath }, -- { 'filename' },
  lualine_x = { 'encoding', 'fileformat', 'filetype' },
  lualine_y = { 'progress' },
  lualine_z = { 'location'  },
}

lualine.inactive_sections = {
  lualine_a = {  },
  lualine_b = {  },
  lualine_c = { 'filename' },
  lualine_x = { 'location' },
  lualine_y = {  },
  lualine_z = {  }
}

lualine.status()
