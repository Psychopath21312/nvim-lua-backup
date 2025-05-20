return {

	{
		"folke/which-key.nvim",
		opts = {
			spec = {
				{ "<BS>", desc = "Decrement Selection", mode = "x" },
				{ "<c-space>", desc = "Increment Selection", mode = { "x", "n" } },
			}
		}
	},

	{
		"nvim-lualine/lualine.nvim",
		event = "VeryLazy",
		opts = function()
			return {
				--[[add your custom lualine config here]]
			}
		end
	},

	{
		'akinsho/bufferline.nvim',
		version = "*",
		dependencies = 'nvim-tree/nvim-web-devicons'
	},

	{
		"folke/noice.nvim",
		dependencies = {
			"MunifTanjim/nui.nvim",  -- Вспомогательная библиотека
			"rcarriga/nvim-notify",   -- Красивые уведомления (опционально)
		},
		config = function()
			require("noice").setup({
				cmdline = {
					view = "cmdline_popup",  -- Стиль командной строки (popup, input)
				},
			})
		end,
	},

	{
		"rcarriga/nvim-notify",
		opts = {
			background_colour = "#000000"
		}
	}
}
