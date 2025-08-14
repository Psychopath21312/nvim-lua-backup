-- Общие параметры табуляции
vim.opt.expandtab = true -- Пробелы вместо табов
vim.opt.smartindent = true -- Умное автоотступление
vim.opt.autoindent = true
vim.opt.tabstop = 4 -- Кол-во пробелов за таб по умолчанию
vim.opt.shiftwidth = 4 -- Шаг смещения по умолчанию
vim.opt.softtabstop = 4

-- Настройки под конкретные языки
local lang_indents = {
	lua = { shiftwidth = 2, tabstop = 2, softtabstop = 2 },
	python = { shiftwidth = 4, tabstop = 4, softtabstop = 4 },
	javascript = { shiftwidth = 2, tabstop = 2, softtabstop = 2 },
	typescript = { shiftwidth = 2, tabstop = 2, softtabstop = 2 },
	html = { shiftwidth = 2, tabstop = 2, softtabstop = 2 },
	css = { shiftwidth = 2, tabstop = 2, softtabstop = 2 },
}

-- Автокоманда, чтобы менять отступы при открытии файла
vim.api.nvim_create_autocmd("FileType", {
	pattern = "*",
	callback = function(args)
		local ft = args.match
		if lang_indents[ft] then
			for opt, val in pairs(lang_indents[ft]) do
				vim.opt_local[opt] = val
			end
		end
	end,
})

-- Маппинг для Tab / Shift-Tab как смещения в визуальном режиме
vim.keymap.set("v", "<Tab>", ">gv", { noremap = true })
vim.keymap.set("v", "<S-Tab>", "<gv", { noremap = true })
