local nvim_lsp = require('lspconfig')

local on_attach = function(client, bufnr)
	local function map(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
	local function option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

	option('omnifunc', 'v:lua.vim.lsp.omnifunc')

	local opts = { noremap=true,silent=true }
	map('n','gD','<cmd>lua vim.lsp.buf.declaration()<CR>',opts)
	map('n','gd','<cmd>lua vim.lsp.buf.definition()<CR>',opts)
	map('n','K','<cmd>lua vim.lsp.buf.hover()<CR>',opts)
	map('n','gi','<cmd>lua vim.lsp.buf.implementation()<CR>',opts)
	map('n','<space>d','<cmd>lua vim.lsp.buf.type_definition()<CR>',opts)
	map('n','gr','<cmd>lua vim.lsp.buf.references()<CR>',opts)
	map('n','<space>g','<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>',opts)
	map('n','[d','<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>',opts)
	map('n',']d','<cmd>lua vim.lsp.diagnostic.goto_next()<CR>',opts)

	-- Set some keybinds conditional on server capabilities
	if client.resolved_capabilities.document_formatting then
		map("n","<space>f","<cmd>lua vim.lsp.buf.formatting()<CR>",opts)
	elseif client.resolved_capabilities.document_range_formatting then
		map("n","<space>f","<cmd>lua vim.lsp.buf.formatting()<CR>",opts)
	end

	-- -- Set autocommands conditional on server_capabilities
	-- if client.resolved_capabilities.document_highlight then
	-- 	vim.api.nvim_exec([[
	-- 		hi LspReferenceRead cterm=bold ctermbg=red guibg=LightYellow
	-- 		hi LspReferenceText cterm=bold ctermbg=red guibg=LightYellow
	-- 		hi LspReferenceWrite cterm=bold ctermbg=red guibg=LightYellow
	-- 		augroup lsp_document_highlight
	-- 			autocmd!
	-- 			autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
	-- 			autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
	-- 		augroup END
	-- 	]], false)
	-- end

end

-- see: https://github.com/neovim/nvim-lspconfig
local servers = { "rnix", "pyls", "rls", "html", "rust_analyzer", "clangd" }
for _, lsp in ipairs(servers) do
	nvim_lsp[lsp].setup { on_attach = on_attach }
end

-- disable diagnostics, they are ruining my view.
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
	vim.lsp.diagnostic.on_publish_diagnostics, {
		virtual_text = false
	}
)
