return {

	{
		"rust-lang/rust.vim",
		ft = "rust",
		init = function()
			vim.g.rustfmt_autosave = 1
		end
	},

	{       -- Debugging
		'mrcjkb/rustaceanvim',
		version = '^6', -- Recommended
		lazy = false, -- This plugin is already lazy
		ft = 'rust',
		config = function()
			local codelldb = vim.fn.expand("$MASON/packages/codelldb")
			local extension_path = codelldb .. '/extension/'
			local codelldb_path = extension_path .. 'adapter/codelldb'
			local liblldb_path = extension_path .. 'lldb/lib/liblldb.so'
			      -- The liblldb extension is .so for Linux and .dylib for MacOS
			local cfg = require('rustaceanvim.config')

			return {
				dap = {
					adapter = cfg.get_codelldb_adapter(codelldb_path, liblldb_path),
				}
			}
		end
	},

	
	{
		'saecki/crates.nvim',
		tag = 'stable',
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
			}
		}
	},

	vim.keymap.set("n", "<Leader>dt", "<cmd>lua vim.cmd('RustLsp testables')<CR>", { desc = "Debugger testables(rustaceanvim)" })
}
