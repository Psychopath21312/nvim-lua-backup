return {
	"williamboman/mason.nvim",
	dependencies = {
		"mason-org/mason-lspconfig.nvim",
	},
	cmd = "Mason",
	build = ":MasonUpdate",
	opts_extend = { "ensure_installed" },
	opts = {
		ensure_installed = {
			"pyright",
			"rust-analyzer",
			"debugpy",
			"codelldb",
			"typescript-language-server",
			"stylua",
			"shellcheck",
		},
	},
	config = function(_, opts)
		require("mason-lspconfig").setup {
        		automatic_installation = true, -- Автоматическая установка LSP
		}
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
}
