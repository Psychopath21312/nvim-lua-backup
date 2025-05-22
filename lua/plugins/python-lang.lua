return {
	"mfussenegger/nvim-dap-python",
	ft = "python",
	dependencies = { "williamboman/mason.nvim" },
	config = function()
		local dap_python = require("dap-python")
		local python = vim.fn.expand("$MASON/packages/debugpy/venv/bin/python")

		dap_python.setup(python)
	end,
}
