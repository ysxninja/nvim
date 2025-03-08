-- customize mason plugins
return {
  -- use mason-lspconfig to configure LSP installations
  {
    "williamboman/mason-lspconfig.nvim",
    -- overrides `require("mason-lspconfig").setup(...)`
    opts = {
      ensure_installed = {
        "lua_ls",
        "gopls",
        "bashls",
        "ansiblels",
        "jsonls",
        "dockerls",
        "pyright",
        "rust_analyzer",
        -- "ts_ls",
        "yamlls",
        -- "tailwindcss"
      },
    },
    -- -- Use gopls setup provided by go.nvim
    -- config = function()
    --   -- setup your go.nvim
    --   -- make sure lsp_cfg is disabled
    --   require("mason").setup()
    --   require("mason-lspconfig").setup()
    --   require('go').setup {
    --     lsp_cfg = false
    --     -- other setups...
    --   }
    --   local cfg = require 'go.lsp'.config() -- config() return the go.nvim gopls setup
    --
    --   require('lspconfig').gopls.setup(cfg)
    -- end,
  },
  -- use mason-null-ls to configure Formatters/Linter installation for null-ls sources
  {
    "jay-babu/mason-null-ls.nvim",
    -- overrides `require("mason-null-ls").setup(...)`
    opts = {
      ensure_installed = {
        -- Formatters
        "prettier",   -- for web dev
        -- "stylua",     -- for lua
        "black",      -- for python
        "shfmt",      -- for shell > bash etc
        "yamlfix",    -- for yaml
        -- Linters
        "eslint_d",   -- Js and Ts
        "shellcheck", -- Shell
        -- "tflint",  -- Terraform
        "yamllint",   -- Yaml
        "ruff-lsp",       -- Python
      },
    },
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    -- overrides `require("mason-nvim-dap").setup(...)`
    opts = {
      -- ensure_installed = { "python" },
    },
  },
}
