return {
	{ -- Highlight, edit, and navigate code
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		main = "nvim-treesitter.configs", -- Sets main module to use for opts
		opts = {
			ensure_installed = {
				"bash",
				"c",
				"diff",
				"html",
				"lua",
				"luadoc",
				"markdown",
				"markdown_inline",
				"query",
				"vim",
				"vimdoc",
				"python",
				"latex",
				"bibtex",
                "r",
			},
			auto_install = true,
			highlight = {
				enable = true,
				-- Some languages depend on vim's regex highlighting system (such as Ruby) for indent rules.
				--  If you are experiencing weird indenting issues, add the language to
				--  the list of additional_vim_regex_highlighting and disabled languages for indent.
				additional_vim_regex_highlighting = { "ruby" },
			},
			indent = { enable = true, disable = { "ruby" } },
			textobjects = {
				move = {
					enable = true,
					set_jumps = true, -- you can change this if you want.
					goto_next_start = {
						--- ... other keymaps
						["]b"] = { query = "@code_cell.inner", desc = "next code block" },
					},
					goto_previous_start = {
						--- ... other keymaps
						["[b"] = { query = "@code_cell.inner", desc = "previous code block" },
					},
				},
				select = {
					enable = true,
					lookahead = true, -- you can change this if you want
					keymaps = {
						--- ... other keymaps
						["ib"] = { query = "@code_cell.inner", desc = "in block" },
						["ab"] = { query = "@code_cell.outer", desc = "around block" },
					},
				},
				swap = { -- Swap only works with code blocks that are under the same
					-- markdown header
					enable = true,
					swap_next = {
						--- ... other keymap
						["<leader>bj"] = "@code_cell.outer",
					},
					swap_previous = {
						--- ... other keymap
						["<leader>bk"] = "@code_cell.outer",
					},
				},
			},
		},
	},
	{ "nvim-treesitter/playground" },
	{
		"nvim-treesitter/nvim-treesitter-textobjects",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		after = "nvim-treesitter",
	},
}
