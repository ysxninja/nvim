return {
  -- nvim-orgmode
  {
  'nvim-orgmode/orgmode',
  event = 'VeryLazy',
  ft = { 'org' },
  config = function()
    -- Setup orgmode
    require('orgmode').setup({
      org_agenda_files = '~/orgfiles/**/*',
      org_default_notes_file = '~/orgfiles/refile.org',
      -- org_startup_folded = 'content', --content, overview, inherit, everything
    })

  end,
  },
  -- orgmode-plugins
  -- org-roam
  {
    "chipsenkbeil/org-roam.nvim",
    event = 'VeryLazy',
    ft = { 'org' },
    tag = "0.1.0",
    dependencies = {
      {
        "nvim-orgmode/orgmode",
        tag = "0.3.4",
      },
    },
    config = function()
      require("org-roam").setup({
       directory = "~/orgfiles",
      })
    end
  },
  --
  -- Org-bullets
  {
    "akinsho/org-bullets.nvim",
    event = 'VeryLazy',
    ft = { 'org' },
    config = function ()
      -- Setup bullets
      require('org-bullets').setup({
        -- concealcursor = false, -- If false then when the cursor is on a line underlying characters are visible
        symbols = {
          -- list symbol
          -- list = "•",
          -- headlines can be a list
          -- headlines = { "◉", "○", "✸", "✿" },
          -- or a function that receives the defaults and returns a list
          -- headlines = function(default_list)
            --table.insert(default_list, "♥")
            --return default_list
          -- end,
          -- or false to disable the symbol. Works for all symbols
          -- headlines = false,
          -- checkboxes = {
          --   half = { "", "OrgTSCheckboxHalfChecked" },
          --   done = { "✓", "OrgDone" },
          --   todo = { "˟", "OrgTODO" },
          -- },
        }
      })
    end,
  },

  --
  -- headlines, adds highlights for markdown, orgmode and neorg
  {
    "lukas-reineke/headlines.nvim",
    event = 'VeryLazy',
    enabled = false,
    dependencies = "nvim-treesitter/nvim-treesitter",
    -- ft = { 'org' },
    config = function()
      require("headlines").setup()
    end,
  },
  --
}
