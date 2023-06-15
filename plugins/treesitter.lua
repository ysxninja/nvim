return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = {
      "bash", "c", "dockerfile", "python",
      "rust", "lua",
      "go", "gomod", "gowork", "gosum",
      "json", "json5", "jsonc",
      "typescript", "javascript", "tsx",
      "yaml" },
  },
}
