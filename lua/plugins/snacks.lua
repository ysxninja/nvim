return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = function(_, opts)
    local get_icon = require("astroui").get_icon
    opts.dashboard = {
      preset = {
        keys = {
          {
            key = "s",
            action = "<Leader>Sl",
            align = "center",
            text = {
              { "  " }, -- icon (no hl)
              { "Restore Session", width = 35 },
              { "[s]" },
            },
          },
          {
            key = "n",
            action = "<Leader>n",
            align = "center",
            text = {
              { "  " }, -- icon (no hl)
              { "New File", width = 35 },
              { "[s]" },
            },
          },
          {
            key = "f",
            action = "<Leader>ff",
            align = "center",
            text = {
              { "  " }, -- icon (no hl)
              { "Find File", width = 35 },
              { "[f]" },
            },
          },
          {
            key = "o",
            action = "<Leader>fo",
            align = "center",
            text = {
              { "  " }, -- icon (no hl)
              { "Recent Files", width = 35 },
              { "[s]" },
            },
          },
          {
            key = "w",
            action = "<Leader>fw",
            align = "center",
            text = {
              { "  " }, -- icon (no hl)
              { "Find Word", width = 35 },
              { "[s]" },
            },
          },
          -- { key = "'", action = "<Leader>f'", icon = get_icon("Bookmarks", 0, true), desc = "Bookmarks  " },
        },
        header = table.concat(require("plugins.alpha.alpha-headers")["random"], "\n"),
      },
      sections = {
        { section = "header", padding = 0 },
        { section = "keys", gap = 1, padding = 1 },
        -- { section = "startup" },
      },
    }
    -- explorer = { enabled = true },
    -- indent = { enabled = true },
    -- input = { enabled = true },
    -- picker = { enabled = true },
    -- notifier = { enabled = true },
    -- quickfile = { enabled = true },
    -- scope = { enabled = true },
    -- scroll = { enabled = true },
    -- statuscolumn = { enabled = true },
    -- words = { enabled = true },
  end,
}
