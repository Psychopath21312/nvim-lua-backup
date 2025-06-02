return {

	{
		"williamboman/mason.nvim",
		opts_extend = { "ensure_installed" },
		opts = {
			ensure_installed = {
				-- LSP
				"pyright", -- Python
				"rust-analyzer", -- Rust
				"typescript-language-server",
				-- DAP
				"debugpy", -- Python
				"codelldb", -- C, C++, Rust
				-- Linters
				"shellcheck",
				"ruff", -- Python
				"selene", -- Lua
				-- Formatters
				"stylua", -- Lua
			},
		},
		config = function(_, opts)
			require("mason").setup(opts)
			local mr = require("mason-registry")
			local function ensure_installed()
				for _, tool in ipairs(opts.ensure_installed) do
					local p = mr.get_package(tool)
					if not p:is_installed() then
						p:install()
					end
				end
			end
			if mr.refresh then
				mr.refresh(ensure_installed)
			else
				ensure_installed()
			end
		end,
	},

	{
		"mason-org/mason-lspconfig.nvim",
		dependencies = { "williamboman/mason.nvim" },
		opts = {
			automatic_enable = {
				exclude = {
					"rust_analyzer",
				},
			},
		},
		config = function(_, opts)
			require("mason-lspconfig").setup(opts)
		end,
	},
}
