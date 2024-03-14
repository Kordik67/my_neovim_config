return {
	"epwalsh/obsidian.nvim",
	version = "*",
	lazy = true,
	ft = "markdown",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope.nvim",
		"hrsh7th/nvim-cmp",
	},
	opts = {
		workspaces = {
			{
				name = "personal",
				path = "~/vaults/personal",
			},
			{
				name = "work",
				path = "~/vaults/work",
			},
		},
		completion = {
			nvim_cmp = true,
			min_chars = 2,
			prepant_note_id = true,
		},
		new_notes_location = "current_dir",
		sort_by = "modified",
		sort_reversed = true,
		open_notes_in = "current",
	},
}
