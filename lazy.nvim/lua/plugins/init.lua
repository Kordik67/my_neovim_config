-- List of plugins
local plugins = {}

-- Function to add a plugin to the list
local function add_plugin(spec)
	if spec then
		table.insert(plugins, spec)
	end
end

-- Function to recursively explore a directory and add Lua files as plugins
local function explore_directory(path)
	-- Get a list of Lua files and folders in the specified path
	local files = vim.fn.globpath(vim.fn.stdpath("config") .. "/lua/plugins/" .. path, "*.lua", true, true)
	local folders = vim.fn.globpath(vim.fn.stdpath("config") .. "/lua/plugins/" .. path, "*/", true, true)

	-- Iterate over Lua files and add them as plugins
	for _, file in ipairs(files) do
		local plugin_path = file:match("/plugins/(.*)%.lua$")
		if plugin_path and not plugin_path:find("init") then
			plugin_path = string.gsub(plugin_path, "/", ".")
			add_plugin(require("plugins." .. plugin_path))
		end
	end

	-- Recursively explore subdirectories
	for _, folder in ipairs(folders) do
		local folder_name = folder:match("/plugins/(.*)/$")
		explore_directory(folder_name)
	end
end

-- Explore the main plugins directory
explore_directory("")

-- Return the list of declared plugins
return plugins
