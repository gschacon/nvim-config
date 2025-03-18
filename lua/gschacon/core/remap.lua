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


vim.keymap.set('n', '<C-S-l>', ':vertical resize -2<CR>', {desc = "Decrease window vertically"})
vim.keymap.set('n', '<C-S-j>', ':resize +2<CR>', {desc = "Increase window horizontoally"})
vim.keymap.set('n', '<C-S-k>', ':resize -2<CR>', {desc = "Decrease window horizontally"})
vim.keymap.set('n', '<C-S-h>', ':vertical resize +2<CR>', {desc = "Increase window vertically"})


vim.keymap.set("n", "<leader>so", "<cmd>split<CR>", { desc = "[S]plit H[o]rizontally" })
vim.keymap.set("n", "<leader>sv", "<cmd>vsplit<CR>", { desc = "[S]plit [V]ertically" })

vim.keymap.set("n", "gb", "<C-o>", { desc = "[G]o [B]ack" })
vim.keymap.set("n", "gf", "<C-i>", { desc = "[G]o [F]oward" })
