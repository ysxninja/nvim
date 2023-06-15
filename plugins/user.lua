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
    event = "VeryLazy",
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
    "lambdalisue/suda.vim",
    event = "VeryLazy",
  }
  {
    "fatih/vim-go",
    -- ft = "go"
  }
}
