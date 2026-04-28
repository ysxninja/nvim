---@type LazySpec
return {
  "WhoIsSethDaniel/mason-tool-installer.nvim",
  opts = {
    ensure_installed = {
      -- Language Servers
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
      "typos-lsp",
      "taplo",
      "css-lsp",
      "sqls",

      -- Formatters
      "prettier", -- for web dev
      -- "stylua",     -- for lua
      "black", -- for python
      "isort", -- for python
      "shfmt", -- for shell > bash etc
      "stylua",
      -- Linters
      "eslint_d", -- Js and Ts
      "shellcheck", -- Shell
      "ansible-lint", -- ansible
      "ruff", -- Python
      "taplo", -- Toml
      -- "sqlfluff", -- Sql

      -- Debuggers
      -- "bash-debug-adapter",
      -- "cpptools",
      -- "debugpy",
      -- "delve",
      -- "haskell-debug-adapter",
      -- "js-debug-adapter",
      -- "php-debug-adapter",

      -- Other Tools
      -- "tree-sitter-cli",
    },
    integrations = {
      ["mason-lspconfig"] = false,
      ["mason-nvim-dap"] = false,
    },
  },
}
