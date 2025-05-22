return {
	{
		"stevearc/conform.nvim",
		opts = {
			formatters_by_ft = {
				lua = { "stylua" },
				-- You can add other filetypes here
			},
			format_on_save = function(bufnr)
				local filetype = vim.bo[bufnr].filetype

				if filetype == "lua" then
					return { timeout_ms = 500, lsp_fallback = true }
				end

				-- for others languages
				return false
			end,
		},
		config = function(_, opts)
			require("conform").setup(opts)
		end,
	},
}
