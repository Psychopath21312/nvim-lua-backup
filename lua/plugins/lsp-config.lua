return {
	"neovim/nvim-lspconfig",
	dependencies = { "williamboman/mason.nvim", "williamboman/mason-lspconfig.nvim" },
	opts = {
		servers = {
			rust_analyzer = { enabled = false },
		}
	},
	config = function(_, opts)
		servers = opts.servers
	end
}
