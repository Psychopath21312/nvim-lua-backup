return {

	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",  -- Автообновление парсеров при изменении конфига
		event = { "BufReadPost", "BufNewFile" },  -- Ленивая загрузка
		cmd = { "TSUpdate", "TSInstall" },  -- Команды для ручного управления
		dependencies = {
			"nvim-treesitter/nvim-treesitter-textobjects",  -- Работа с объектами кода
			"windwp/nvim-ts-autotag",  -- Автозакрытие HTML/XML-тегов
		},
		config = function()
			require("nvim-treesitter.configs").setup({
				-- Автоустановка парсеров (список языков)
				ensure_installed = {
					"lua", "python", "rust", "javascript", "typescript",
					"html", "css", "json", "yaml", "bash", "markdown"
				},
	
				-- Основные модули
				highlight = {
					enable = true,  -- Включить подсветку синтаксиса
					additional_vim_regex_highlighting = false,  -- Отключить старый regex-парсер
				},
				indent = { enable = true },  -- Автоотступы
				incremental_selection = {  -- Инкрементальное выделение
					enable = true,
					keymaps = {
						init_selection = "gnn",
						node_incremental = "grn",
						scope_incremental = "grc",
					},
				},
	
	
				-- Дополнительные фичи
				autotag = { enable = true },  -- Для nvim-ts-autotag
				context_commentstring = { enable = true },  -- Умные комментарии
			})
	
			-- Настройка foldmethod на основе tree-sitter
			-- vim.opt.foldmethod = "expr"
			-- vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
		end,
	},
}

