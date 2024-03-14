return {
	{
		"williamboman/mason.nvim",
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
			"neovim/nvim-lspconfig",
		},
		keys = {
			{ "<leader>m", "<cmd>Mason<CR>", desc = "Mason" },
		},
		build = ":MasonUpdate",
		opts = {
			ensure_installed = {
				"java-test",
				"java-debug-adapter",
				"markdownlint",
				"marksman",
				"codelldb",
			},
			ui = {
				border = "rounded",
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
				log_level = vim.log.levels.INFO,
				max_concurrent_installers = 4,
			},
		},
		config = function(_, opts)
			require("mason").setup(opts)
			require("mason-lspconfig").setup({
				ensure_installed = { "prismals", "tsserver" },
				automatic_installation = true,
			})

			--[[local mr = require("mason-registry")

		local function ensure_installed()
			for _, tool in ipairs(opts.ensure_installed) do
				local p = mr.get_package(tool)
				if not p:is_installed() then
					p:install()
				end
			end
		end
		if mr.refresh then
			mr.refresh(ensure_installed)
		else
			ensure_installed()
		end]]
		end,
	},
}
