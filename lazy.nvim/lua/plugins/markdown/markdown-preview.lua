return {
	"iamcco/markdown-preview.nvim",
	ft = "markdown",
	build = function()
		vim.fn["mkdp#util#install"]()
	end,
	cmd = {
		"MarkdownPreviewToggle",
		"MarkdownPreview",
		"MarkdownPreviewStop",
	},
	keys = {
		"<leader>mp",
		ft = "markdown",
		"<cmd>MarkdownPreview<CR>",
		desc = "Markdown Preview",
	},
	config = function()
		vim.cmd([[do FileType]])
	end,
}
