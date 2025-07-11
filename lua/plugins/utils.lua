return {

	{ "nvim-lua/plenary.nvim", lazy = true }, -- Library for others plugins

	-- Session managment
	{
		"folke/persistence.nvim",
		event = "BufReadPre",
		opts = {},
	},

	{
		"akinsho/toggleterm.nvim",
		version = "*",
		config = true,
	},

	{
		"nvim-telescope/telescope.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
	},
}
