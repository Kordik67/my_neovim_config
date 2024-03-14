return {
	"nvim-treesitter/nvim-treesitter",
	tag = nil,
	branch = "master",
	run = ":TSUpdate",
	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = {
				"markdown",
				"markdown_inline",
				"java",
				"c",
				"cpp",
			},
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
			},
			indent = {
				enable = true,
			},
			incremental_selection = {
				enable = true,
				keymaps = {},
			},
			textobjects = {
				select = {
					enable = true,
					lookahead = true,
					keymaps = {},
				},
				move = {
					enable = true,
					set_jumps = true,
				},
			},
		})
	end,
}
