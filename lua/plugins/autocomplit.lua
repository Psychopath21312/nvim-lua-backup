return {
	{
		"hrsh7th/nvim-cmp",  -- Main plugin for autocomplit
		event = "InsertEnter",  -- Loading after insert mode
		dependencies = {
			-- Sources:
			"hrsh7th/cmp-nvim-lsp",  -- LSP
			"hrsh7th/cmp-buffer",    -- Text from buffer
			"hrsh7th/cmp-path",      -- Path to files
			"hrsh7th/cmp-cmdline",   -- Commands (:, /, ?)
			"saadparwaiz1/cmp_luasnip", -- Snippets

			-- Snippets
            "L3MON4D3/LuaSnip"
		},
		config = function()
			local cmp = require("cmp")
			local luasnip = require ("luasnip")

			cmp.setup({
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body)
					end,
				},
				-- Сниппеты
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "luasnip" },  -- Source for snippets
					{ name = "buffer" },
					{ name = "path" },
				}),

				mapping = cmp.mapping.preset.insert({
					["<C-Space>"] = cmp.mapping.complete(),  -- Open menu
					["<CR>"] = cmp.mapping.confirm({ select = true }),  -- Confirm your choice
					["<Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_next_item()
						elseif luasnip.expand_or_jumpable() then
							luasnip.expand_or_jump()
						else
							fallback()
						end
					end, { "i", "s" }),
					["<S-Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_prev_item()
						elseif luasnip.jumpable(-1) then
							luasnip.jump(-1)
						else
							fallback()
						end
					end, { "i", "s" }),
				}),

				-- Appearance
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
				experimental = {
					ghost_text = true,  -- Semi-transparent hints
				},

			})
			-- Autocomplit for cmdline
			cmp.setup.cmdline({ "/", "?" }, {
				mapping = cmp.mapping.preset.cmdline(),
				sources = { { name = "buffer" } },
			})
			cmp.setup.cmdline(":", {
				mapping = cmp.mapping.preset.cmdline(),
				sources = cmp.config.sources({ { name = "path" } }, { { name = "cmdline" } }),
			})
		end,
	},

	-- Plugin for snippets
	{
		"L3MON4D3/LuaSnip",
		version = "v2.*",
		build = "make install_jsregexp",
		dependencies = { "rafamadriz/friendly-snippets" },  -- Default snippets
		config = function()
			require("luasnip.loaders.from_vscode").lazy_load()  -- Loading snippets from friendly-snippets
			require("luasnip").setup({})
		end,
	},

	-- Default snippets
	{
		"rafamadriz/friendly-snippets",
		lazy = true,
	},

	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",  -- Loading after insert mode
		config = function()
			require("nvim-autopairs").setup({
				disable_filetype = { "TelescopePrompt", "spectre_panel" },
				check_ts = true,  -- Use Treesitter for check context
				ts_config = {
					lua = { "string" },  -- Не закрывать кавычки в Lua-строках
					javascript = { "template_string" },
				},
			})
			
			-- nvim-cmp integration
			local cmp_autopairs = require("nvim-autopairs.completion.cmp")
			local cmp = require("cmp")
			cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
		end,
	}
}
