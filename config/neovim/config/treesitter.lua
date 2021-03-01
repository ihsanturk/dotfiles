-- one of "all", "maintained" (parsers with maintainers), or a list of
-- languages

require'nvim-treesitter.configs'.setup {
	-- ensure_installed = "maintained", -- fuck this line
	highlight = {
		enable = true,             -- false will disable the whole extension
		-- disable = { "c", "rust" }, -- list of language that will be disabled
	},
}
