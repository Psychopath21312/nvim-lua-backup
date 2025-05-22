return {

	{ -- Basic support
		"rust-lang/rust.vim",
		ft = "rust",
		init = function()
			vim.g.rustfmt_autosave = 0 -- Disable formatting
		end,
	},

	{ -- Debugging
		"mrcjkb/rustaceanvim",
		dependencies = { "williamboman/mason.nvim" },
		version = "^6", -- Recommended
		lazy = false, -- This plugin is already lazy
		ft = "rust",
		opts = {
			tools = {},
			server = {
				default_settings = {
					["rust-analyzer"] = {
						cargo = {
							allFeatures = true,
							loadOutDirsFromCheck = true,
							buildScripts = {
								enable = true,
							},
						},
						procMacro = {
							enable = true,
							ignored = {
								["async-trait"] = { "async_trait" },
								["napi-derive"] = { "napi" },
								["async-recursion"] = { "async_recursion" },
							},
						},
					},
				},
				on_attach = function(_, bufnr)
					-- rust-analyzer config for :w
				end,
			},
		},
		config = function(_, opts)
			local codelldb = vim.fn.expand("$MASON/packages/codelldb")
			local extension_path = codelldb .. "/extension/"
			local codelldb_path = extension_path .. "adapter/codelldb"
			local liblldb_path = extension_path .. "lldb/lib/liblldb.so"
			-- The liblldb extension is .so for Linux and .dylib for MacOS
			local cfg = require("rustaceanvim.config")

			opts.dap = {
				adapter = cfg.get_codelldb_adapter(codelldb_path, liblldb_path),
			}
			-- vim.g.rustaceanvim = vim.tbl_deep_extend("keep", vim.g.rustaceanvim or {}, opts or {})
			vim.g.rustaceanvim = opts
		end,
	},

	{
		"saecki/crates.nvim",
		ft = "rust",
		tag = "stable",
		opts = {
			completion = {
				crates = {
					enabled = true,
				},
			},
			lsp = {
				enabled = true,
				actions = true,
				completion = true,
				hover = true,
			},
		},
	},

	vim.keymap.set(
		"n",
		"<Leader>dt",
		"<cmd>lua vim.cmd('RustLsp testables')<CR>",
		{ desc = "Debugger testables(rustaceanvim)" }
	),
}
