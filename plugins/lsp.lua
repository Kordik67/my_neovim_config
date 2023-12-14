return {
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "actionlint",
        "blade-formatter",
        "codelldb",
	"eslint_d",
        "html-lsp",
        "intelephense",
        -- "luacheck",
        "phpstan",
        "php-debug-adapter",
        "pint",
        "prettierd",
        "selene",
        "shellcheck",
        "shfmt",
        "stylua",
        "typescript-language-server",
      })
    end,
  },
}
