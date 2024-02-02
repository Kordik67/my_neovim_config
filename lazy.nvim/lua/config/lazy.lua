local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if vim.fn.isdirectory(lazypath) == 0 then
	vim.notify(" Installing lazy and plugins", vim.log.levels.INFO, { title = "lazy.nvim" })
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end

vim.opt.rtp:prepend(lazypath)

local opts = {
	spec = {
		{ import = "plugins" },
	},
	git = {
		timeout = 300,
		url_format = "https://github.com/%s.git",
	},
	lockfile = vim.fn.stdpath("data") .. "/lazy-lock.json",
	concurrency = 10,
	install = {
		missing = true,
		colorscheme = { "solarized-osaka" },
	},
	ui = {
		size = { width = 0.8, height = 0.8 },
		border = "rounded",
		icons = {
			ft = "",
			lazy = "󰒲 ",
			loaded = "",
			not_loaded = "",
			cmd = " ",
			config = "",
			event = "",
			init = " ",
			keys = " ",
			plugin = " ",
			runtime = " ",
			source = " ",
			start = "",
			task = " ",
		},
		throttle = 20,
		diff = {
			cmd = "git",
		},
	},
	checker = {
		enabled = true,
		concurrency = nil,
		notify = true,
		frequency = 3600,
	},
	change_detection = {
		enabled = true,
		notify = true,
	},
	defaults = {
		lazy = false,
		version = false,
	},
	performance = {
		cache = {
			enabled = true,
			path = vim.fn.stdpath("state") .. "/lazy/cache",
			disable_events = { "UIEnter", "VimEnter", "BufReadPre" },
		},
		reset_packpath = true,
		rtp = {
			reset = false,
			disabled_plugins = {
				"gzip",
				-- "matchit",
				"matchparen",
				"netrwPlugin",
				"tarPlugin",
				"tohtml",
				-- "tutor",
				"zipPlugin",
			},
		},
	},
}

local status_ok, lazy = pcall(require, "lazy")
if not status_ok then
	return
end

lazy.setup(require("plugins.init"), opts)
