return { -- Theme. Try :Telescope colorscheme
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000, -- Ensure the theme loads first
	config = function()
		require("catppuccin").setup({
		term_colors = true,
		transparent_background = false,
		styles = {
			comments = {},
			conditionals = {},
			loops = {},
			functions = {},
			keywords = {},
			strings = {},
			variables = {},
			numbers = {},
			booleans = {},
			properties = {},
			types = {},
		},
		color_overrides = {
			mocha = {
				base = "#000000",
				mantle = "#000000",
				crust = "#000000",
			},
		},
		integrations = {
			telescope = {
				enabled = true,
			},
			dropbar = {
				enabled = true,
				color_mode = true,
			},
		},
	})
		vim.cmd.colorscheme("catppuccin")
		-- vim.api.nvim_set_hl(0, "Normal", { bg = "#000000" })
	    -- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#000000" })
	end,
}
