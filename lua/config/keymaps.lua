local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- Fast exit
map("n", "<leader>qq", ":qa!<CR>", { desc = "Exit all" })

-- Neotree
map("n", "<leader>e", ":Neotree toggle<CR>", { desc = "Toggle NeoTree" })
map("n", "<leader>o", ":Neotree focus<CR>", { desc = "Focus NeoTree" })

-- Terminal
map("n", "<Leader>t", ":ToggleTerm size=15 dir=%:p:h<CR>", { desc = "Toggle Terminal" })

-- Dap debugger
map("n", "<Leader>dl", "<cmd>lua require'dap'.step_into()<CR>", { desc = "Debugger step into" })
map("n", "<Leader>dj", "<cmd>lua require'dap'.step_over()<CR>", { desc = "Debugger step over" })
map("n", "<Leader>dk", "<cmd>lua require'dap'.step_out()<CR>", { desc = "Debugger step out" })
map("n", "<Leader>dc", "<cmd>lua require'dap'.continue()<CR>", { desc = "Debugger continue" })
map("n", "<Leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<CR>", { desc = "Debugger toggle breakpoint" })
map(
	"n",
	"<Leader>dd",
	"<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>",
	{ desc = "Debugger set conditional breakpoint" }
)
map("n", "<Leader>de", "<cmd>lua require'dap'.terminate()<CR>", { desc = "Debugger reset" })
map("n", "<Leader>dr", "<cmd>lua require'dap'.run_last()<CR>", { desc = "Debugger run last" })

-- Dap-ui Toggle
map("n", "<leader>du", "<cmd>lua require'dap-view'.toggle()<CR>", { desc = "DebuggerUI toggle" })

-- Session Managment
map("n", "<leader>qs", "<cmd>lua require'persistence'.load()<CR>", { desc = "Restore Session" })
map("n", "<leader>qS", "<cmd>lua require'persistence'.select()<CR>", { desc = "Select Session" })
map("n", "<leader>ql", "<cmd>lua require'persistence'.load({ last = true })<CR>", { desc = "Restore Last Session" })
map("n", "<leader>qd", "<cmd>lua require'persistence'.stop()<CR>", { desc = "Don't Save Current Session" })

-- Windows Navigation
map("n", "<C-h>", "<C-w>h", { desc = "Left window" })
map("n", "<C-j>", "<C-w>j", { desc = "Down window" })
map("n", "<C-k>", "<C-w>k", { desc = "Up window" })
map("n", "<C-l>", "<C-w>l", { desc = "Right window" })
