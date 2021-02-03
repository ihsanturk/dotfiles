require'lspconfig'.rnix.setup{}
require'lspconfig'.pyls.setup{}
require'lspconfig'.rls.setup{}

local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

