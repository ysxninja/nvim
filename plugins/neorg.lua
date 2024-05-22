return {
  "nvim-neorg/neorg",
  dependencies = { "nvim-lua/plenary.nvim", "luarocks.nvim" },
  cmd = { "Neorg" },
  lazy = false,
  config = function()
    require("neorg").setup {
      load = {
        ["core.defaults"] = {},  -- Loads default behaviour
        ["core.concealer"] = {
          config = {
            icon_preset = "diamond", -- diamond, varied
          },
        }, -- Adds pretty icons to your documents
        ["core.dirman"] = {      -- Manages Neorg workspaces
          config = {
            workspaces = {
              notes = "~/notes",
            },
            default_workspace = "notes",
          },
        },
        ["core.completion"] = {
          config = {
            engine = "nvim-cmp",
          },
        },
        ["core.integrations.treesitter"] = {},
        ["core.summary"] = {},
        ["core.export"] = {},
        ["core.tangle"] = {},
      },
    }
  end,
}
