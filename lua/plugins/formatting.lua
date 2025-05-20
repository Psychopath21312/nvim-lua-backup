return {
	'stevearc/conform.nvim',
	opts = {},
	config = function()
		require('conform').setup({

			formatters_by_ft = {
				rust = { "rustfmt" },
				lua = { "stylua" },
				-- You can add other filetypes here
			},

			format_on_save = {
				timeout_ms = 500,
				lsp_fallback = true,
			},

		})
	end
}
