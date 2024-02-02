local lazy_status = require("lazy.status")
local package_info = require("plugins.web.package-info")

return {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"meuter/lualine-so-fancy.nvim",
	},
	event = "VeryLazy",
	opts = {
		options = {
			icons_enabled = true,
			ignore_focus = {},
			always_divide_middle = true,
			globalstatus = false,
			refresh = {
				statusline = 1000,
			},
		},
		sections = {
			lualine_a = {
				{
					"datetime",
					style = "󰃭 %a %d %b 󰇙 %H:%M",
				},
			},
			lualine_b = {
				{ "fancy_branch" },
				{ "fancy_diff" },
			},
			lualine_c = {
				{ "fancy_cwd", substitute_home = true }, -- doesn't update when opening recent file using dashboard
				{ package_info.get_status },
			},
			lualine_x = {
				{
					lazy_status.updates,
					cond = lazy_status.has_updates,
				},
				{ "fancy_diagnostics" },
			},
			lualine_y = {
				"fancy_filetype",
			},
		},
		inactive_sections = {
			lualine_a = {},
			lualine_b = {},
			lualine_c = { "filename" },
			lualine_x = { "location" },
			lualine_y = {},
			lualine_z = {},
		},
	},
}

-- Default configuration
--[[
sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },

]]
--
