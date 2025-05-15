return {
	"neovim/nvim-lspconfig",
	dependencies = { "williamboman/mason.nvim", "williamboman/mason-lspconfig.nvim" },
	config = function()
		servers = {
			rust_analyzer = { enabled = false }
		}
	end
}

