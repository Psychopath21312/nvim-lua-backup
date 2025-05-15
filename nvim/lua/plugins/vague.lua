return {
  "vague2k/vague.nvim",
  priority = 1000,
  config = function()
    require("vague").setup({
      transparent = true,
      style = {
        sidebars = "transparent",
        floats = "transparent",
      },
    })
    vim.cmd.colorscheme("vague")
  end,
}
