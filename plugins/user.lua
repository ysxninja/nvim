return {
  -- You can also add new plugins here as well:
  -- Add plugins, the lazy syntax
  -- "andweeb/presence.nvim",
  -- {
  --   "ray-x/lsp_signature.nvim",
  --   event = "BufRead",
  --   config = function()
  --     require("lsp_signature").setup()
  --   end,
  -- },
  {
    "navarasu/onedark.nvim",
    config = function()
      require('onedark').setup {
        style = 'dark',
        transparent = true,
      }
      require('onedark').load()
      -- require('lualine').setup {
      --   options = {
      --     theme = 'onedark'
      --   }
      -- }
    end

  },
  {
    "vimwiki/vimwiki",
    branch = "dev",
    -- lazy = false,
    -- priority = 1000,
    event = "VeryLazy",
    init = function()
      vim.g.vimwiki_list = {
        {
          path = "~/vimwiki/",
          syntax = "markdown",
          ext = ".md",
          auto_diary_index = 1,
        }
      }
      -- Use vimwiki filetype only for vimwiki files
      vim.g.vimwiki_global_ext = 0
    end
  },
  {
    "ThePrimeagen/vim-be-good",
    event = "VeryLazy",
  },
  {
    "ThePrimeagen/harpoon"
  },
  {
    "ambv/black",
    -- event = "VeryLazy",
    ft = "python",
  },
  {
    "dsznajder/vscode-es7-javascript-react-snippets",
    -- event = "VeryLazy",
    ft = {
      "javascript",
      "javascriptreact",
      "typescriptreact",
      "typescript",
    },
    run = "yarn install --frozen-lockfile && yarn compile",
  },
  -- {
  --   "github/copilot.vim"
  -- event = "VeryLazy"
  -- },
  {
    "vimpostor/vim-tpipeline",
    lazy = false,
    -- priority = 1000,
    -- event = "VeryLazy"
  },
  {
    "tpope/vim-eunuch",
    event = "VeryLazy",
  },
  {
    "folke/persistence.nvim"
    ,
    event = "BufReadPre",
    opts = {
      -- add any custom options here
    }
  },
  {
    "ahmedkhalf/project.nvim",
    event = "VeryLazy",
    config = function()
      require('telescope').load_extension('projects')
    end
  },
  {
    "ray-x/go.nvim",
    dependencies = { -- optional packages
      "ray-x/guihua.lua",
      "neovim/nvim-lspconfig",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("go").setup()
    end,
    event = { "CmdlineEnter" },
    ft = { "go", 'gomod' },
    build = ':lua require("go.install").update_all_sync()' -- if you need to install/update all binaries
  }
  ,
}
