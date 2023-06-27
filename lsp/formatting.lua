return {
  -- control auto formatting on save
  format_on_save = {
    -- enabled = true,     -- enable or disable format on save globally
    allow_filetypes = { -- enable format on save for specified filetypes only
      "go",
      "lua",
    },
    ignore_filetypes = { -- disable format on save for specified filetypes
      -- "python",
      -- "c",
    },
  },
  disabled = { -- disable formatting capabilities for the listed language servers
    -- "sumneko_lua",
  },
  timeout_ms = 1000, -- default format timeout
  -- filter = function(client) -- fully override the default formatting function
  --   return true
  -- end
}
