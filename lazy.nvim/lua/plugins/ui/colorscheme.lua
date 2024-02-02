return {
	{
		"craftzdog/solarized-osaka.nvim",
		branch = "osaka",
		priority = 2000,
		opts = function()
			return {
				transparent = true,
			}
		end,
		config = function()
			vim.cmd([[colorscheme solarized-osaka]])
		end,
	},
}
