return {
	"3rd/image.nvim",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-neorg/neorg",
	},
	-- lazy = true,
	-- dev = true,
	-- cond = not (vim.g.started_by_firenvim or vim.env["MD_MODE"] == "1"),
	config = function()
		local backend = "kitty"
		local shell

		if vim.fn.has("nvim-0.10.0") == 1 then
			shell = function(command)
				local obj = vim.system(command, { text = true }):wait()

				if obj.code ~= 0 then
					return nil
				end

				return obj.stdout
			end
		else
			shell = function(command)
				command = table.concat(command, " ")
				local handle = io.open(command)
				if handle == nil then
					return nil
				end

				local result = handle:read("*a")
				handle:close()
				return result
			end
		end

		-- check if imagemagick is available
		if shell({ "convert", "-version" }) == nil then
			return
		end

		if backend == "kitty" then
			-- check if kitty is available
			local out = shell({ "kitty", "--version" })
			if out == nil then
				return
			end

			local kitty_version = out:match("(%d+%.%d+%.%d+)")
			if kitty_version == nil then
				return
			end

			local v = vim.version.parse(kitty_version)
			local minimal = vim.version.parse("0.30.1")
			if v and vim.version.cmp(v, minimal) < 0 then
				return
			end
		end

		--[[local tmux = vim.fn.getenv("TMUX")
		if tmux ~= vim.NIL then
			local offset = 96
			local out = shell({ "tmux", "-V" })
			if out == nil then
				return
			end

			out = out:gsub("\n", "")
			local letter = out:match("tmux %d+%.%d+([a-z])")
			local number
			if letter == nil then
				number = 0
			else
				number = string.byte(letter) - offset
			end

			local version = out:gsub("tmux (%d+%.%d+)([a-z])", "%1." .. number)
			local v = vim.version.parse(version)
			local minimal = vim.version.parse("3.3.1")
			if v and vim.version.cmp(v, minimal) < 0 then
				return
			end
		end]]

		-- load user-installed installed Lua rocks
		package.path = package.path .. ";" .. vim.fn.expand("$HOME") .. "/.luarocks/share/lua/5.1/?/init.lua;"
		package.path = package.path .. ";" .. vim.fn.expand("$HOME") .. "/.luarocks/share/lua/5.1/?.lua;"

		-- check if magick luarock is available
		local ok, magick = pcall(require, "magick")
		if not ok then
			-- print("magick luarock is not available")
			return
		end

		require("image").setup({
			backend = backend,
			integrations = {
				markdown = {
					enabled = true,
					-- clear_in_insert_mode = false,
					-- download_remote_images = false, --true,
					only_render_image_at_cursor = false,
					filetypes = { "markdown", "vimwiki", "quarto" }, -- markdown extensions (ie. quarto) can go here
				},
				neorg = {
					enabled = true,
					only_render_image_at_cursor = false,
					filetypes = { "norg" },
				},
			},
			max_width = 100,
			max_height = 15,
			--max_width_window_percentage = nil,
			--max_height_window_percentage = 50,
			--window_overlap_clear_enabled = false, -- toggles images when windows are overlapped
			--window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "notify", "" },
			editor_only_render_when_focused = false, -- auto show/hide images when the editor gains/looses focus
			tmux_show_only_in_active_window = true, --false, -- auto show/hide images in the correct Tmux window (needs visual-activity off)
			hijack_file_patterns = { "*.png", "*.jpg", "*.jpeg", "*.gif", "*.webp" }, -- render image files as images when opened
		})
	end,
}
