return {
	{
		"mfussenegger/nvim-dap",
		config = function()
			local dap = require('dap')

			-- CodeLLDB Adapter
			dap.adapters.codelldb = {
			  type = 'server',
			  port = '${port}',
			  executable = {
			    command = vim.fn.stdpath('data') .. '/mason/bin/codelldb',
			    args = { '--port', '${port}' },
			  }
			}
			
			-- C and C++ configs
			dap.configurations.c = {
				{
					name = 'Launch (codelldb)',
					type = 'codelldb',
					request = 'launch',
					program = function()
						return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
					end,
					cwd = '${workspaceFolder}',
					stopOnEntry = false,
					terminal = 'integrated',
				}
			}
			dap.configurations.cpp = dap.configurations.c -- C++
		end
	},
	-- Async compiling
	{
		 
	}
}
