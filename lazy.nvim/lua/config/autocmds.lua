vim.api.nvim_create_autocmd("BufWritePost", {
	pattern = { "prisma" },
	command = "CocCommand editor.action.formatDocument",
})
