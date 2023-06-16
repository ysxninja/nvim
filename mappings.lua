-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
return {
  -- first key is the mode
  n = {
    -- second key is the lefthand side of the map
    -- mappings seen under group name "Buffer"
    ["<leader>bn"] = { "<cmd>tabnew<cr>", desc = "New tab" },
    ["<leader>bD"] = {
      function()
        require("astronvim.utils.status").heirline.buffer_picker(
          function(bufnr) require("astronvim.utils.buffer").close(bufnr) end
        )
      end,
      desc = "Pick to close",
    },
    -- tables with the `name` key will be registered with which-key if it's installed
    -- this is useful for naming menus
    ["<leader>b"] = { name = "Buffers" },
    -- quick save
    -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
    -- ["<leader>ee"] = { "<cmd>Neotree toggle<cr>", desc = "Toggle explorer with default source" },
    -- ["<leader>eb"] = { "<cmd>Neotree source=buffers<cr>", desc = "Toggle Explorer and focus source buffers" },
    -- ["<leader>eg"] = { "<cmd>Neotree source=git_status<cr>", desc = "Toggle Explorer and focus source git_status" }
    ["<leader>fp"] = { "<cmd>Telescope project<cr>", desc = "Toggle Projects Picker" },
    ["<leader>r"] = { name = " CodeRunner" },
    ["<leader>rb"] = { "<cmd>GoBuild<cr>", desc = "Build go project" },
    ["<leader>ri"] = { "<cmd>GoInstall<cr>", desc = "Install go project" },
    ["<leader>rr"] = { "<cmd>GoRun<cr>", desc = "Run go project" },
    ["<leader>rt"] = { "<cmd>GoTest<cr>", desc = "Run test on go project" },

    ["<C-h>"] = { "<cmd>TmuxNavigateLeft<cr>", desc = "window left" },
    ["<C-l>"] = { "<cmd>TmuxNavigateRight<cr>", desc = "window right" },
    ["<C-j>"] = { "<cmd>TmuxNavigateDown<cr>", desc = "window down" },
    ["<C-k>"] = { "<cmd>TmuxNavigateUp<CR>", desc = "window up" },
  },
  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
  },
}
