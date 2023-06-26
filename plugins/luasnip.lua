return {
  "L3MON4D3/LuaSnip",
  build = vim.fn.has "win32" ~= 0
      and "echo 'NOTE: jsregexp is optional, so not a big deal if it fails to build\n'; make install_jsregexp"
    or nil,
  dependencies = { "rafamadriz/friendly-snippets" },
  opts = { store_selection_keys = "<C-x>" },
  config = require "plugins.configs.luasnip",
}
