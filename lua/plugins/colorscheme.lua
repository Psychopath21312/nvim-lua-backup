return {
	"vague2k/vague.nvim",
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
