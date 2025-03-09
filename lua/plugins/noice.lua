---@type LazySpec
return {
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      -- OPTIONAL:
      -- `nvim-notify` is only needed, if you want to use the notification view.
      -- If not available, we use `mini` as the fallback
      "rcarriga/nvim-notify",
    },
    opts = {
      cmdline = {
        view = "cmdline",
        format = {
          -- cmdline = { pattern = "^:", icon = "󱂂", lang = "vim" }, --  , 󰮾, 󱂂  v-furigana,󱂁, 󰘳, 󰇝, 󰮎
        },
      },
      messages = {
        -- NOTE: If you enable messages, then the cmdline is enabled automatically.
        -- This is a current Neovim limitation.
        enabled = true, -- enables the Noice messages UI
        view = "mini", -- default view for messages
        view_error = "messages", -- view for errors
        view_warn = "mini", -- view for warnings
        view_history = "messages", -- view for :messages
        view_search = false, -- view for search count messages. virtualtext, Set to `false` to disable
      },
      lsp = {
        progress = { enabled = false },
        hover = { enabled = false },
        signature = { enabled = false },
      },
      routes = {
        { filter = { event = "msg_show", cmdline = "^:lua" }, view = "messages" }, -- send lua output to split
        { filter = { event = "msg_show", find = "%d+L,%s%d+B" }, opts = { skip = true } }, -- skip save notifications
        { filter = { event = "msg_show", find = "^%d+ more lines$" }, opts = { skip = true } }, -- skip paste notifications
        { filter = { event = "msg_show", find = "^%d+ fewer lines$" }, opts = { skip = true } }, -- skip delete notifications
        { filter = { event = "msg_show", find = "^%d+ lines yanked$" }, opts = { skip = true } }, -- skip yank notifications
        { view = "messages", filter = { event = "msg_show", min_height = 30 } }, -- route more than 30 line messages
        { filter = { event = "msg_show", kind = "", find = "written" }, view = "mini" }, -- hide written messages
        { filter = { event = "msg_show", kind = "", find = "change" }, view = "mini" }, -- hide written messages
        { filter = { event = "msg_show", kind = "", find = "after" }, view = "mini" }, -- hide written messages
        { filter = { event = "msg_show", kind = "", find = "less" }, view = "mini" }, -- hide written messages
        -- { view = "messages", filter = { event = "msg_show", kind = "" } }, -- route kind unknown e.g. :TSConfigInfo
      },
      presets = { long_message_to_split = true },
    },
    specs = {
      { "rcarriga/nvim-notify", init = false, config = true },
      {
        "catppuccin",
        optional = true,
        ---@type CatppuccinOptions
        opts = { integrations = { noice = true } },
      },
    },
  },
}
