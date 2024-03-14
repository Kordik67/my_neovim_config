return {
	"michaelrommel/nvim-silicon",
	lazy = true,
	cmd = "Silicon",
	init = function()
		local wk = require("which-key")
		wk.register({
			["<leader>sc"] = { ":Silicon<CR>", "Snapshot Code" },
		})
	end,
	config = function()
		require("silicon").setup({
			font = "JetBrainsMono Nerd Font=34",
			theme = "Dracula",
			to_clipboard = true,
			window_title = function()
				return vim.fn.fnamemodify(vim.api.nvim_buf_get_name(vim.api.nvim_get_current_buf()), ":t")
			end,
		})
	end,
}
