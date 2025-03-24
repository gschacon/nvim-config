return {
	"benlubas/molten-nvim",
	version = "^1.0.0", -- use version <2.0.0 to avoid breaking changes
	dependencies = { "3rd/image.nvim" },
	build = ":UpdateRemotePlugins",
	init = function()
		-- these are examples, not defaults. Please see the readme
		vim.g.molten_image_provider = "image.nvim"
		vim.g.molten_output_win_max_height = 50
		vim.g.molten_auto_open_output = true

		-- optional, I like wrapping. works for virt text and the output window
		vim.g.molten_wrap_output = false
		vim.g.molten_virt_text_output = true
		vim.g.molten_virt_lines_off_by_1 = true
		vim.keymap.set(
			"n",
			"<localleader>me",
			":MoltenEvaluateOperator<CR>",
			{ desc = "[M]olten [E]valuate Operator", silent = true }
		)
		vim.keymap.set(
			"n",
			"<localleader>mo",
			":noautocmd MoltenEnterOutput<CR>",
			{ desc = "[M]olten [O]pen Output Window", silent = true }
		)
		vim.keymap.set(
			"n",
			"<localleader>mr",
			":MoltenReevaluateCell<CR>",
			{ desc = "[M]olten [R]e-eval cell", silent = true }
		)
		vim.keymap.set(
			"v",
			"<localleader>mv",
			":<C-u>MoltenEvaluateVisual<CR>gv",
			{ desc = "Molten Execute [V]isual Selection", silent = true }
		)
		vim.keymap.set(
			"n",
			"<localleader>mh",
			":MoltenHideOutput<CR>",
			{ desc = "[M]olten [H]ide output window", silent = true }
		)
		vim.keymap.set("n", "<localleader>md", ":MoltenDelete<CR>", { desc = "[M]olten [D]elete Cell", silent = true })

		vim.keymap.set(
			"n",
			"<localleader>mb",
			":MoltenOpenInBrowser<CR>",
			{ desc = "[M]olten Open Output in [B]rowser", silent = true }
		)
		vim.keymap.set("n", "<leader>mi", ":MoltenInit<CR>", { desc = "[M]olten [I]nit" })
	end,
}
