return {

	{ "nvim-lua/plenary.nvim", lazy = true }, -- Library for others plugins

	-- Session managment
	{
		"folke/persistence.nvim",
		event = "BufReadPre",
		opts = {},
	}

}
