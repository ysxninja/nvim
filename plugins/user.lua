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
       "ya-suke/onedark.nvim",
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
       config = function()
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
       "ThePrimeagen/vim-be-good"
     },
     {
       "ThePrimeagen/harpoon"
     },
     {
       "ambv/black"
     },
     {
       "dsznajder/vscode-es7-javascript-react-snippets",
       run = "yarn install --frozen-lockfile && yarn compile"
     },
     -- {
     --   "github/copilot.vim"
     -- },
     {
       "vimpostor/vim-tpipeline"
     },
     {
       "lambdalisue/suda.vim"
     }
}
