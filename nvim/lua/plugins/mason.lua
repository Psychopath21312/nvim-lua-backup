return {
  "williamboman/mason.nvim",
  opts = {
    ensure_installed = {
      "rust-analyzer",
      "codelldb",
      "stylua",
      "shellcheck",
      "shfmt",
      "flake8",
    },
  },
}
