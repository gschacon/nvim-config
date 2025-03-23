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
	end,

	dependencies = {
		"jmbuhr/otter.nvim",
	},
}
