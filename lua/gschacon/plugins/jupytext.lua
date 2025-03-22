return { -- directly open ipynb files as quarto docuements
	-- and convert back behind the scenes
	"GCBallesteros/jupytext.nvim",
	lazy = false,
	opts = {
		custom_language_formatting = {
			python = {
				extension = "qmd",
				style = "quarto",
				force_ft = "quarto",
			},
			r = {
				extension = "qmd",
				style = "quarto",
				force_ft = "quarto",
			},
		},
		style = "markdown",
		output_extension = "md",
		force_ft = "markdown",
	},
}
