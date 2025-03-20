return { -- Manage git inside nvim
	"tpope/vim-fugitive",
	config = function()
		vim.keymap.set("n", "<leader>gs", vim.cmd.Git, { desc = "[G]it [S]tatus" })
		vim.keymap.set("n", "<leader>ga", ":Git add .<CR>", { desc = "[G]it [A]dd ." })
		vim.keymap.set("n", "<leader>gm", ":Git commit<CR>", { desc = "[G]it [C]ommit" })
		vim.keymap.set("n", "<leader>gp", ":Git push<CR>", { desc = "[G]it [P]ush" })
	end,
}
