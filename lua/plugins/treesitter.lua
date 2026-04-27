-- Customize Treesitter
-- --------------------
-- Treesitter customizations are handled with AstroCore
-- as nvim-treesitter simply provides a download utility for parsers

---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    treesitter = {
      highlight = true, -- enable/disable treesitter based highlighting
      indent = true, -- enable/disable treesitter based indentation
      auto_install = true, -- enable/disable automatic installation of detected languages
      ensure_installed = {
        "bash",
        "c",
        "dockerfile",
        "python",
        "rust",
        "lua",
        "go",
        "java",
        "gomod",
        "gowork",
        "gosum",
        "json",
        "json5",
        "jsonc",
        "latex",
        "typescript",
        "javascript",
        "rasi",
        "tsx",
        "yaml",
        "regex",
        "markdown",
        "markdown_inline",
        "vimdoc",
      },
    },
  },
}
