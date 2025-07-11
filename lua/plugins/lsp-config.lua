return {
	"neovim/nvim-lspconfig",
	dependencies = { "williamboman/mason.nvim", "williamboman/mason-lspconfig.nvim" },
	opts = {
		servers = {
			clangd = {
				cmd = { "clangd", "--clang-tidy", "--completion-style=detailed", "--header-insertion=iwyu" },
				on_attach = function(client, bufnr) end,
			},
			omnisharp = {
				enable_roslyn_analyzers = true,
				organize_imports_on_format = true,
			},
		},
	},
	config = function(_, opts)
		local lspconfig = require("lspconfig")
		for server, server_opts in pairs(opts.servers) do
			lspconfig[server].setup(server_opts)
		end
	end,
}
