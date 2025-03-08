return {
  "goolord/alpha-nvim",
  cmd = "Alpha",
  opts = function()
    local dashboard = require "alpha.themes.dashboard"
    dashboard.section.header.val = require("plugins.alpha.alpha-headers")["random"]
    dashboard.section.header.opts = {
      position = "center",
      hl = "DashboardHeader",
    }

    -- local button = require("astrocore").alpha_button
    dashboard.section.buttons.val = {
      dashboard.button("s", " " .. " Restore Session", [[:lua require("persistence").load() <cr>]]),
      dashboard.button("n", " " .. " New file", ":ene <BAR> startinsert <CR>"),
      dashboard.button("f", " " .. " Find file", ":Telescope find_files <CR>"),
      dashboard.button("r", " " .. " Recent files", ":Telescope oldfiles <CR>"),
      dashboard.button("w", " " .. " Find word", ":Telescope live_grep <CR>"),
      dashboard.button("p", " " .. " Projects", [[:lua require("telescope").extensions.projects.projects{} <cr>]]),
      -- dashboard.button("c", " " .. " Config", ":e $MYVIMRC <CR>"),
      -- button("LDR n  ", "  New File  "),
      -- button("LDR f f", "  Find File  "),
      -- button("LDR f o", "󰈙  Recents  "),
      -- button("LDR f w", "󰈭  Find Word  "),
      -- button("LDR f '", "  Bookmarks  "),
      -- button("LDR S l", "  Last Session  "),
    }
    dashboard.section.buttons.position = "center"

    for _, button in ipairs(dashboard.section.buttons.val) do
      button.opts.hl = "DashboardButtons"
      button.opts.hl_shortcut = "DashboardShortcut"
    end

    dashboard.section.header.opts.hl = "DashboardHeader"
    dashboard.section.buttons.opts.hl = "DashboardButtons"
    dashboard.section.footer.opts.hl = "DashboardFooter"

    dashboard.config.layout[1].val = vim.fn.max { 2, vim.fn.floor(vim.fn.winheight(0) * 0.12) }
    dashboard.config.layout[3].val = 3
    dashboard.config.opts.noautocmd = true
    return dashboard
  end,
}
