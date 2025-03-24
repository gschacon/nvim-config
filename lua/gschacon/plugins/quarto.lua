return { -- requires plugins in lua/plugins/treesitter.lua and lua/plugins/lsp.lua
	-- for complete functionality (language features)
	"quarto-dev/quarto-nvim",
	ft = { "quarto", "markdown" },
	dev = false,
	config = function()
		local quarto = require("quarto")
		quarto.setup({
			lspFeatures = {
				languages = { "r", "python", "julia" },
				chunks = "all",
				diagnostics = {
					enabled = true,
					triggers = { "BufWritePost" },
				},
				completion = {
					enabled = true,
				},
			},
			keymap = {
				hover = "H",
				definition = "gd",
				rename = "<leader>rn",
				references = "gr",
				format = "<leader>f",
			},
			codeRunner = {
				enabled = true,
				default_method = "molten",
			},
		})

		local runner = require("quarto.runner")
		vim.keymap.set("n", "<leader>qi", ":QuartoActivate<CR>", { desc = "[Q]uarto [I]nit", silent = true })
		vim.keymap.set("n", "<leader>qc", runner.run_cell, { desc = "[Q]uarto Run [C]ell", silent = true })
		vim.keymap.set("n", "<leader>qb", runner.run_above, { desc = "[Q]uarto Run Cell and A[b]ove", silent = true })
		vim.keymap.set("n", "<leader>qa", runner.run_all, { desc = "[Q]uarto Run [A]ll Cells", silent = true })
		vim.keymap.set("n", "<leader>ql", runner.run_line, { desc = "[Q]arto Run [L]ine", silent = true })
		vim.keymap.set("v", "<leader>qv", runner.run_range, { desc = "[Q]uarto Run [V]isual Range", silent = true })
		vim.keymap.set("n", "<leader>qA", function()
			runner.run_all(true)
		end, { desc = "[Q]uarto Run All cells of [A]ll languages", silent = true })

		-- Keymaps for Python cells

		vim.keymap.set("n", "<leader>qnep", function()
			local lines = { "", "```python", "", "```", "" }
			vim.cmd("normal! G")
			vim.api.nvim_put(lines, "l", true, true)
			local row = vim.api.nvim_buf_line_count(0) - 2
			vim.api.nvim_win_set_cursor(0, { row, 0 })
		end, { desc = "[Q]uarto [N]ew at the [E]nd [P]ython Cell" })
		vim.keymap.set(
			"n",
			"<leader>qnp",
			":normal ]b2k<CR>i<CR>```python<CR><CR>```<CR><Esc>2k",
			{ desc = "[Q]uarto [N]ew [P]yton Cell", silent = true }
		)
		vim.keymap.set(
			"n",
			"<leader>qop",
			":normal [b2k<CR>i<CR>```python<CR><CR>```<CR><Esc>2k",
			{ desc = "[Q]uarto [O]ld [P]yton Cell", silent = true }
		)
		vim.keymap.set("n", "<S-Enter>", function()
			runner.run_cell()
			vim.cmd("normal ]b")
		end)
		vim.keymap.set("n", "<A-Enter>", function()
			runner.run_cell()
			vim.cmd("normal ]b")
			vim.cmd("normal! 2k")
			local lines = { "", "```python", "", "```", "" }
			vim.api.nvim_put(lines, "l", true, true)
			vim.cmd("normal! 3k")
		end)

		-- Keymaps for R cells

		vim.keymap.set("n", "<leader>qner", function()
			local lines = { "", "```R", "", "```", "" }
			vim.cmd("normal! G")
			vim.api.nvim_put(lines, "l", true, true)
			local row = vim.api.nvim_buf_line_count(0) - 2
			vim.api.nvim_win_set_cursor(0, { row, 0 })
		end, { desc = "[Q]uarto [N]ew at the [E]nd [R] Cell" })
		vim.keymap.set(
			"n",
			"<leader>qnr",
			":normal ]b2k<CR>i<CR>```R<CR><CR>```<CR><Esc>2k",
			{ desc = "[Q]uarto [N]ew [R] Cell", silent = true }
		)
		vim.keymap.set(
			"n",
			"<leader>qor",
			":normal [b2k<CR>i<CR>```R<CR><CR>```<CR><Esc>2k",
			{ desc = "[Q]uarto [O]ld [R] Cell", silent = true }
		)
	end,

	dependencies = {
		"jmbuhr/otter.nvim",
		"nvim-treesitter/nvim-treesitter",
		"nvim-treesitter/nvim-treesitter-textobjects",
	},
}
