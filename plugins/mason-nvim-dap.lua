return {
  "jay-babu/mason-nvim-dap.nvim",
  dependencies = "mason.nvim",
  cmd = { "DapInstall", "DapUninstall" },
  opts = {
    -- Makes a best effort to setup the various debuggers with reasonnable debug configurations
    automatic_setup = true,
    -- You can provide additional configuration to the handlers, see mason-nvim-dap README for more information
    handlers = {
      function(config)
        -- all sources with no handlers get passed here

        -- Keep original functionnality
        require("mason-nvim-dap").default_setup(config)
      end,
      php = function(config)
        config.configurations = {
          {
            type = "php",
            request = "launch",
            name = "Listen for Xdebug",
            port = 9003,
            pathMappings = {
              ["${workspaceFolder}"] = "${workspaceFolder}",
              ["/var/www/html"] = "${workspaceFolder}",
            },
          },
        }
        require("mason-nvim-dap").default_setup(config) -- don't forget this !
      end,
    },
    ensure_installed = {
      "php",
    },
  },
}
