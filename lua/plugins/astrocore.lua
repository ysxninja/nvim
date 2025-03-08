-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
-- Configuration documentation can be found with `:h astrocore`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing

---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    -- Configure core features of AstroNvim
    -- icons_enabled = true,
    features = {
      large_buf = { size = 1024 * 256, lines = 10000 }, -- set global limits for large files for disabling features like treesitter
      autopairs = true, -- enable autopairs at start
      cmp = true, -- enable completion at start
      diagnostics_mode = 3, -- diagnostic mode on start (0 = off, 1 = no signs/virtual text, 2 = no virtual text, 3 = on)
      highlighturl = true, -- highlight URLs at start
      notifications = true, -- enable notifications at start
    },
    -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
    diagnostics = {
      virtual_text = true,
      underline = true,
    },
    -- vim options can be configured here
    options = {
      opt = { -- vim.opt.<key>
    	relativenumber = true, -- sets vim.opt.relativenumber
    	number = true, -- sets vim.opt.number
    	spell = false, -- sets vim.opt.spell
    	signcolumn = "auto", -- sets vim.opt.signcolumn to auto
    	-- TODO: set wrap to false when using a high performance machine
    	wrap = true, -- sets vim.opt.wrap
    	mouse = "", -- sets vim.opt.mouse to disabled
    	conceallevel = 2, ---sets vim.opt.conceallevel
    	foldmethod = "manual",
    	foldlevelstart = 99,
    	swapfile = false,
      },
      g = { -- vim.g.<key>
        -- configure global vim variables (vim.g)
        -- NOTE: `mapleader` and `maplocalleader` must be set in the AstroNvim opts or before `lazy.setup`
        -- This can be found in the `lua/lazy_setup.lua` file
      },
    },
    -- Mappings can be configured through AstroCore as well.
    -- NOTE: keycodes follow the casing in the vimdocs. For example, `<Leader>` must be capitalized
    mappings = {
      -- first key is the mode
      n = {
        -- disable default bindings
        ["<C-Down>"] = false,
        ["<C-Left>"] = false,
        ["<C-Right>"] = false,
        ["<C-Up>"] = false,
        ["<C-q>"] = false,
        ["<leader>q"] = false,
        ["<C-s>"] = false,
        ["q:"] = ":",
        -- better buffer navigation
        -- ["]b"] = false,
        -- ["[b"] = false,
        -- alternate buffer navigation
        ["<S-l>"] = {
          function() require("astrocore.buffer").nav(vim.v.count > 0 and vim.v.count or 1) end,
          desc = "Next buffer",
        },
        ["<S-h>"] = {
          function() require("astrocore.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1)) end,
          desc = "Previous buffer",
        },
        -- better search
        -- n = { utils.better_search "n", desc = "Next search" },
        -- N = { utils.better_search "N", desc = "Previous search" },
        -- better increment/decrement
        ["-"] = { "<c-x>", desc = "Descrement number" },
        ["+"] = { "<c-a>", desc = "Increment number" },
        -- resize with Shift+arrows
        ["<S-Up>"] = { function() require("smart-splits").resize_up(2) end, desc = "Resize split up" },
        ["<S-Down>"] = { function() require("smart-splits").resize_down(2) end, desc = "Resize split down" },
        ["<S-Left>"] = { function() require("smart-splits").resize_left(2) end, desc = "Resize split left" },
        ["<S-Right>"] = { function() require("smart-splits").resize_right(2) end, desc = "Resize split right" },
        -- buffer switching
        -- ["<Tab>"] = {
        --   function()
        --     if #vim.t.bufs > 1 then
        --       require("telescope.builtin").buffers { sort_mru = true, ignore_current_buffer = true }
        --     else
        --       astro_utils.notify "No other buffers open"
        --     end
        --   end,
        --   desc = "Switch Buffers",
        -- },
        -- -- vim-sandwich
        -- ["s"] = "<Nop>",
        ["<leader>n"] = { "<cmd>enew<cr>", desc = "New File" },
        ["<leader>N"] = { "<cmd>tabnew<cr>", desc = "New Tab" },
        ["<leader><cr>"] = { '<esc>/<++><cr>"_c4l', desc = "Next Template Using <++>" },

        ["<leader>."] = { "<cmd>cd %:p:h<cr>", desc = "Set CWD" },
        ["<leader>z"] = { "<cmd>ZenMode<cr>", desc = "Zen Mode" },
        -- Trouble Diagnostics
        ["<leader>x"] = { desc = "󰒡 Trouble" },
        ["<leader>xx"] = { "<cmd>TroubleToggle document_diagnostics<cr>", desc = "Document Diagnostics (Trouble)" },
        ["<leader>xX"] = { "<cmd>TroubleToggle workspace_diagnostics<cr>", desc = "Workspace Diagnostics (Trouble)" },
        ["<leader>xl"] = { "<cmd>TroubleToggle loclist<cr>", desc = "Location List (Trouble)" },
        ["<leader>xq"] = { "<cmd>TroubleToggle quickfix<cr>", desc = "Quickfix List (Trouble)" },
        ["<leader>xT"] = { "<cmd>TodoTrouble<cr>", desc = "TODOs (Trouble)" },
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
        ["<leader>fp"] = { "<cmd>Telescope projects<cr>", desc = "Toggle Projects Picker" },
        ["<leader>fg"] = { "<cmd>Telescope grep_string<cr>", desc= "Live grep under cursor"},
        -- ["<leader>ff"] = { "<cmd>Telescope find_files theme=dropdown<cr>", desc = "Find files" },
        ["<leader>ft"] = { "<cmd>TodoTelescope<cr>", desc = "Seach all project todos" },
        ["<leader>r"] = { name = " CodeRunner" },
        ["<leader>rb"] = { "<cmd>GoBuild<cr>", desc = "Build go project" },
        ["<leader>ri"] = { "<cmd>GoInstall<cr>", desc = "Install go project" },
        ["<leader>rr"] = { "<cmd>GoRun -F<cr>", desc = "Run go project" },
        ["<leader>rs"] = { "<cmd>GoStop<cr>", desc = "Stop go project" },
        ["<leader>rt"] = { "<cmd>GoTest<cr>", desc = "Run test on go project" },

        ["<Left>"] = { "<cmd>TmuxNavigateLeft<cr>", desc = "window left" },
        ["<Right>"] = { "<cmd>TmuxNavigateRight<cr>", desc = "window right" },
        ["<Down>"] = { "<cmd>TmuxNavigateDown<cr>", desc = "window down" },
        ["<Up>"] = { "<cmd>TmuxNavigateUp<cr>", desc = "window up" },

        ["<leader>d"] = { [["_d]], desc = "del _d / debugging" },
        -- copy without sending to system clipboard
        ["<leader>y"] = { [["+y]] },
        ["<leader>Y"] = { [["+Y]] },
        -- harpoon
        ["<leader>a"] = { function() require("harpoon.mark").add_file() end, desc = "Harpoon add" },
        ["<leader>v"] = { function() require("harpoon.ui").toggle_quick_menu() end, desc = "Harpoon toggle" },
        ["<leader>1"] = { function() require("harpoon.ui").nav_file(1) end, desc = "1st harpoon" },
        ["<leader>2"] = { function() require("harpoon.ui").nav_file(2) end, desc = "2nd harpoon" },
        ["<leader>3"] = { function() require("harpoon.ui").nav_file(3) end, desc = "3rd harpoon" },
        ["<leader>4"] = { function() require("harpoon.ui").nav_file(4) end, desc = "4th harpoon" },
        -- markmap
        ["<leader>m"] = { name = " Markmap" }, -- 󱝻
        ["<leader>mo"] = { "<cmd>MarkmapOpen<cr>", desc = "Markmap Open" },
        ["<leader>ms"] = { "<cmd>MarkmapSave<cr>", desc = "Markmap Save" },
        ["<leader>mw"] = { "<cmd>MarkmapWatch<cr>", desc = "Markmap Watch" },
        ["<leader>mx"] = { "<cmd>MarkmapWatchStop<cr>", desc = "Markmap Watch Stop" },
      },

      --- Visual and Select
      v = {
        -- send deleted content to abyss
        ["<leader>d"] = { [["_d]], desc = "Delete and send to abyss" },
        -- copy without sending to system clipboard
        ["<leader>y"] = { [["+y]] },
      },
      i = {
        -- signature help, fails silently so attach always
        ["<C-k>"] = { function() vim.lsp.buf.signature_help() end, desc = "Signature help" },
        ["<S-Tab>"] = { "<C-V><Tab>", desc = "Tab character" },
      },
      -- Visual
      x = {
        --- paste without overwriting current register with deleted content
        ["<leader>p"] = { [["_dP]], desc = "Delete and send to abyss then Paste" },
        -- line text-objects e.g delete inside line dil
        -- ["il"] = { "g_o^", desc = "Inside line text object" },
        -- ["al"] = { "$o^", desc = "Around line text object" },
        -- vim-sandwich
        -- ["s"] = "<Nop>",
      },
      -- Operator-pending
      o = {
        -- line text-objects e.g delete inside line dil
        -- ["il"] = { "g_o^", desc = "Inside line text object" },
        -- ["al"] = { "$o^", desc = "Around line text object" },
      },
      -- Terminal Job
      t = {
        -- setting a mapping to false will disable it
        -- ["<esc>"] = false,
      },
    },
  },
}
