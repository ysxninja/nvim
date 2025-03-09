---@type LazySpec
return {
  "WhoIsSethDaniel/mason-tool-installer.nvim",
  cmd = { "MasonToolsInstall", "MasonToolsUpdate", "MasonToolsClean" },
  dependencies = { "williamboman/mason.nvim" },
  init = function(plugin) require("astrocore").on_load("mason.nvim", plugin.name) end,
  opts = {
    ensure_installed = {
      "lua-language-server",
      "gopls",
      "bash-language-server",
      "ansible-language-server",
      "json-lsp",
      "dockerfile-language-server",
      "basedpyright",
      "rust-analyzer",
      "typescript-language-server",
      "yaml-language-server",
      "tailwindcss-language-server",
      "texlab",
      "typos-lsp",
      "taplo",
      "css-lsp",
      "sqls",

      -- Formatters
      "prettierd", -- for web dev
      -- "stylua",     -- for lua
      "black", -- for python
      "isort", -- for python
      "shfmt", -- for shell > bash etc
      "stylua",
      -- Linters
      "eslint_d", -- Js and Ts
      "shellcheck", -- Shell
      "ansible-lint", -- ansible
      "ruff-lsp", -- Python
      "taplo", -- Toml
      "sqlfluff", -- Sql

      -- Debuggers
      "bash-debug-adapter",
      -- "cpptools",
      "debugpy",
      "delve",
      -- "haskell-debug-adapter",
      "js-debug-adapter",
      -- "php-debug-adapter",

      -- Other Tools
      "tree-sitter-cli",
    },
    integrations = {
      ["mason-lspconfig"] = false,
      ["mason-nvim-dap"] = false,
    },
  },
  config = function(_, opts)
    local mason_tool_installer = require "mason-tool-installer"
    mason_tool_installer.setup(opts)
    mason_tool_installer.run_on_start()
  end,
  specs = {
    { "jay-babu/mason-nvim-dap.nvim", optional = true, init = false },
    { "williamboman/mason-lspconfig.nvim", optional = true, init = false },
    { "jay-babu/mason-null-ls.nvim", optional = true, init = false },
  },
}
