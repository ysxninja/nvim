return {
  "nvim-neorg/neorg",
  dependencies = { "nvim-lua/plenary.nvim", "luarocks.nvim" },
  cmd = { "Neorg" },
  lazy = false,
  config = function()
    require("neorg").setup {
      load = {
        ["core.defaults"] = {},  -- Loads default behaviour
        ["core.concealer"] = {}, -- Adds pretty icons to your documents
        ["core.dirman"] = {      -- Manages Neorg workspaces
          config = {
            workspaces = {
              notes = "~/notes",
            },
          },
          ["core.completion"] = {
            config = {
              engine = "nvim-cmp",
            },
          },
        },
      },
    }
  end,
}
