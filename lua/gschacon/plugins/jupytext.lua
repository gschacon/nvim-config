return { -- directly open ipynb files as quarto docuements
	-- and convert back behind the scenes
	"GCBallesteros/jupytext.nvim",
	lazy = false,
	opts = {
		style = "markdown",
		output_extension = "md",
		force_ft = "markdown",
	},
}
