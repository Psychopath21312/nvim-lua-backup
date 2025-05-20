return {

	{
		'mfussenegger/nvim-lint',
		opts = {
			events = { 'BufWritePost', "BufReadPost", "InsertLeave" },
			linters_by_ft = {
				rust = { "bacon" },
				python = { "flake8" },
				lua = { "selene" }
			}
		},
		config = function (_, opts)
			local lint = require('lint')

			lint.linters_by_ft = opts.linters_by_ft
			-- vim.api.nvim_create_autocmd({ "BufWritePost", "BufEnter", "TextChanged", "InsertLeave" }, {
			-- 	callback = function()
			-- 		vim.defer_fn(function()
			-- 			require("lint").try_lint()
			-- 		end, 500) -- wait 500 ms
			-- 	end,
			-- })
		end
	},

	{
		'folke/trouble.nvim',
		cmd = 'Trouble',
		opts = { use_diagnostic_signs = true },
	}

}
