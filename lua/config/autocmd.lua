local tab_settings = vim.api.nvim_create_augroup("TabSettings", { clear = true })

vim.api.nvim_create_autocmd("FileType", {
	group = tab_settings,
	pattern = { "python", "lua", "css", "scss" },
	callback = function()
		vim.bo.tabstop = 4
		vim.bo.shiftwidth = 4
		vim.bo.expandtab = true
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	group = tab_settings,
	pattern = { "c", "cpp" },
	callback = function()
		vim.bo.tabstop = 4
		vim.bo.shiftwidth = 4
		vim.bo.expandtab = false
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	group = tab_settings,
	pattern = { "yuck" },
	callback = function()
		vim.bo.tabstop = 8
		vim.bo.shiftwidth = 8
		vim.bo.expandtab = true
	end,
})
