return {
	"folke/tokyonight.nvim",
	lazy = false,
	opts = {
		-- transparent = true,
		style = {
			sidebard = "transparent",
			floats = "transparent",
		},
	},
	config = function(_, opts)
		local tokyonight = require("tokyonight")
		tokyonight.setup(opts)
		vim.cmd.colorscheme("tokyonight-storm")
	end,
}
