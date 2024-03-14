return {
	"neovim/nvim-lspconfig",
	opts = {
		servers = {
			jdtls = {},
			marksman = {},
			clangd = {
				keys = {
					{ "<leader>cR", "<cmd>ClangdSwitchSourceHeader<CR>", desc = "Switch Source/Header (C/C++)" },
				},
				root_dir = function(fname)
					return require("lspconfig.util").root_pattern(
						"Makefile",
						"configure.ac",
						"configure.in",
						"config.h.in",
						"meson.build",
						"meson_options.txt",
						"build.ninja"
					)(fname) or require("lspconfig.util").root_pattern(
						"compile_commands.json",
						"compile_flags.txt"
					)(fname) or require("lspconfig.util").find_git_ancestor(fname)
				end,
				capabilities = {
					offsetEncoding = { "utf-16" },
				},
				cmd = {
					"clangd",
					"--background-index",
					"--clang-tidy",
					"--header-insertion=iwyu",
					"--completion-style=detailed",
					"--function-arg-placeholders",
					"--fallback-style=llvm",
				},
				init_options = {
					usePlaceholders = true,
					completeUnimported = true,
					clangdFileStatus = true,
				},
			},
		},
		setup = {
			jdtls = function()
				return true
			end,
			clangd = function(_, opts)
				require("clangd_extensions").setup(vim.tbl_deep_extend("force", {}, { server = opts }))
				return false
			end,
		},
	},
	config = function() end,
}
