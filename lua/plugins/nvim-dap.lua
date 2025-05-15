return {
	"mfussenegger/nvim-dap",
	dependencies = { 
		"mfussenegger/nvim-dap",
		"nvim-neotest/nvim-nio",
		"rcarriga/nvim-dap-ui",
		"mfussenegger/nvim-dap-python"
	},
	config = function()
		local dap  = require("dap")
		local dapui = require("dapui")
		local dap_python = require("dap-python")
		local python = vim.fn.expand("$MASON/packages/debugpy/venv/bin/python")

		dapui.setup({})
		dap_python.setup(python)

		dap.listeners.after.event_initialized["dapui_config"] = function()
			dapui.open()
		end

	end
}
