return {
	
	{	
		"igorlfs/nvim-dap-view",
		dependencies = { 
			"williamboman/mason.nvim",
			"mfussenegger/nvim-dap",
			"mfussenegger/nvim-dap-python"
		},
		opts = {
			-- Dap view configuration
			winbar = {
			    show = true,
			    -- You can add a "console" section to merge the terminal with the other views
			    sections = { "watches", "scopes", "exceptions", "breakpoints", "repl" },
			    -- Must be one of the sections declared above
			    default_section = "watches",
			    headers = {
			        breakpoints = "Breakpoints [B]",
			        scopes = "Scopes [S]",
			        exceptions = "Exceptions [E]",
			        watches = "Watches [W]",
			        threads = "Threads [T]",
			        repl = "REPL [R]",
			        console = "Console [C]",
			    },
			    controls = {
			        enabled = true,
			        position = "right",
			        buttons = {
			            "play",
			            "step_into",
			            "step_over",
			            "step_out",
			            "step_back",
			            "run_last",
			            "terminate",
			            "disconnect",
			        },
			        icons = {
			            pause = "",
			            play = "",
			            step_into = "",
			            step_over = "",
			            step_out = "",
			            step_back = "",
			            run_last = "",
			            terminate = "",
			            disconnect = "",
			        },
			        custom_buttons = {},
			    },
			},
			windows = {
			    height = 12,
			    terminal = {
			        -- 'left'|'right'|'above'|'below': Terminal position in layout
			        position = "left",
			        -- List of debug adapters for which the terminal should be ALWAYS hidden
			        hide = {},
			        -- Hide the terminal when starting a new session
			        start_hidden = false,
			    },
			},
			-- Controls how to jump when selecting a breakpoint or navigating the stack
			switchbuf = "usetab,newtab",
		
		},
		config = function(_, opts)
			local dap  = require("dap")
			local dap_view = require("dap-view")
	
			dap_view.setup(opts)
	
			dap.listeners.after.event_initialized["dapui_config"] = function()
				dap_view.open()
			end
			dap.listeners.after.event_initialized["dapui_config"] = function()
				dap_view.open()
			end
		end
	}
}
