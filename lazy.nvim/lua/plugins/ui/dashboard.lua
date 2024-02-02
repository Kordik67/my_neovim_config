return {
	"nvimdev/dashboard-nvim",
	event = "VimEnter",
	opts = function()
		local logo = [[ 
██╗  ██╗ ██████╗ ██████╗ ██████╗ ██╗██╗  ██╗
██║ ██╔╝██╔═══██╗██╔══██╗██╔══██╗██║██║ ██╔╝
█████╔╝ ██║   ██║██████╔╝██║  ██║██║█████╔╝ 
██╔═██╗ ██║   ██║██╔══██╗██║  ██║██║██╔═██╗ 
██║  ██╗╚██████╔╝██║  ██║██████╔╝██║██║  ██╗
╚═╝  ╚═╝ ╚═════╝ ╚═╝  ╚═╝╚═════╝ ╚═╝╚═╝  ╚═╝
]]

		logo = string.rep("\n", 8) .. logo .. "\n\n"

		local opts = {
			theme = "hyper",
			hide = {
				statusline = false,
			},
			config = {
				header = vim.split(logo, "\n"),
				disable_move = true,
				shortcut = {
					{
						desc = " Update",
						action = "Lazy update",
						key = "u",
					},
					{
						desc = " Edit config",
						action = function()
							vim.cmd("edit ~/.config/LazyNvim/init.lua")
						end,
						key = "c",
					},
					{
						desc = "󰅚 Quit",
						action = "<cmd> qa <CR>",
						key = "q",
					},
				},
				projects = {
					limit = 5,
					label = "Recent projects",
					action = "Telescope projects",
				},
				mru = {
					limit = 5,
					label = "Recent files",
					action = "Telescope oldfiles",
				},
			},
		}

		if vim.o.filetype == "lazy" then
			vim.cmd.close()
			vim.api.nvim_create_autocmd("User", {
				pattern = "DashboardLoaded",
				callback = function()
					require("lazy").show()
				end,
			})
		end

		return opts
	end,
}
