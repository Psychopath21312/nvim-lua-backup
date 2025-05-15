return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = {
      "rust",
      "bash",
      "html",
      "javascript",
      "json",
      "lua",
      "markdown",
      "markdown_inline",
      "python",
      "query",
      "regex",
      "tsx",
      "typescript",
      "vim",
      "yaml"
    },
    auto_install = true,
    highlight = {
      enable = true
    }
  }
}
