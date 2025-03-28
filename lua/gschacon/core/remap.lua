vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = "[P]roject [V]iew" })

vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

vim.keymap.set("n", "<leader>tm", ":split | terminal<CR>i", { desc = "[T]erminal [M]ode" })
vim.keymap.set("n", "<leader>TM", ":vsplit | terminal<CR>i", { desc = "[T]erminal [M]ode on vertical split" })

vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

vim.keymap.set("n", "<C-S-l>", ":vertical resize -2<CR>", { desc = "Decrease window vertically" })
vim.keymap.set("n", "<C-S-j>", ":resize +2<CR>", { desc = "Increase window horizontoally" })
vim.keymap.set("n", "<C-S-k>", ":resize -2<CR>", { desc = "Decrease window horizontally" })
vim.keymap.set("n", "<C-S-h>", ":vertical resize +2<CR>", { desc = "Increase window vertically" })

vim.keymap.set("n", "<leader>so", "<cmd>split<CR>", { desc = "[S]plit H[o]rizontally" })
vim.keymap.set("n", "<leader>sv", "<cmd>vsplit<CR>", { desc = "[S]plit [V]ertically" })

vim.keymap.set("n", "gb", "<C-o>", { desc = "[G]o [B]ack" })
vim.keymap.set("n", "gf", "<C-i>", { desc = "[G]o [F]oward" })

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move Selected Lines Down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move Selected Lines Up" })

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("n", "<leader>sp", function()
	vim.opt.spell = not vim.opt.spell:get()
	print("Spell check " .. (vim.opt.spell:get() and "enabled" or "disabled"))
end, { desc = "Toggle [S]pell [C]heck" })

vim.keymap.set("n", "<leader>jf", function()
	-- Get the current file name without extension
	local file_name = vim.fn.expand("%:r") -- Removes extension

	-- Open the corresponding .md file in the same window
	vim.cmd("edit " .. file_name .. ".md")

	-- Format the markdown file
	require("conform").format({ async = false, lsp_format = "fallback" })

	-- Save the markdown file
	vim.cmd("write")

	-- Return to the original .ipynb file
	vim.cmd("edit " .. file_name .. ".ipynb")

	-- Run jupytext commands
	vim.fn.system("jupytext --set-formats ipynb,md " .. file_name .. ".ipynb")
	vim.fn.system("jupytext --sync " .. file_name .. ".ipynb")

	-- Reload the .ipynb file to reflect any external changes
	vim.cmd("edit")

	-- Show a message indicating completion
	vim.notify("Jupytext sync complete!", vim.log.levels.INFO)
end, { desc = "[J]upytext Auto [F]ormat", noremap = true, silent = true })
