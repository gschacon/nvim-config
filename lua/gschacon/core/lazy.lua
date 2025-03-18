local plugins = require("gschacon.plugins")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		error("Error cloning lazy.nvim:\n" .. out)
	end
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	-- "tpope/vim-sleuth", -- Detect tabstop and shiftwidth automatically
	{ -- Adds git related signs to the gutter, as well as utilities for managing changes
		"lewis6991/gitsigns.nvim",
		opts = plugins.gitsigns.opts,
	},
	{ -- Useful plugin to show you pending keybinds.
		"folke/which-key.nvim",
		event = "VimEnter", -- Sets the loading event to 'VimEnter'
		opts = plugins.whichkey.opts,
	},
	{ -- Fuzzy Finder (files, lsp, etc)
		"nvim-telescope/telescope.nvim",
		event = "VimEnter",
		branch = "0.1.x",
		dependencies = plugins.telescope.dependencies,
		config = plugins.telescope.config,
	},

	-- LSP Plugins
	{ -- `lazydev` configures Lua LSP for your Neovim config, runtime and plugins
		"folke/lazydev.nvim",
		ft = "lua",
		opts = plugins.lazydev.opts,
	},
	{ -- Main LSP Configuration
		"neovim/nvim-lspconfig",
		dependencies = plugins.lsp.dependencies,
		config = plugins.lsp.config,
	},

	{ -- Autoformat
		"stevearc/conform.nvim",
		event = plugins.conform.event,
		cmd = plugins.conform.cmd,
		keys = plugins.conform.keys,
		opts = plugins.conform.opts,
	},

	{ -- Autocompletion
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = plugins.cmp.dependencies,
		config = plugins.cmp.config,
	},
	{ -- Theme. Try :Telescope colorscheme
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000, -- Ensure the theme loads first
		opts = plugins.catppuccin.opts,
		config = function()
			require("catppuccin").setup(require("gschacon.plugins.catppuccin").opts)
			vim.cmd.colorscheme("catppuccin")
		end,
	},
	{ -- Highlight todo, notes, etc in comments
		"folke/todo-comments.nvim",
		event = "VimEnter",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = { signs = false },
	},
	{ -- Set better selecting inside and around qutoes, (), {}, [], etc
		"echasnovski/mini.nvim",
		config = plugins.mini.config,
	},
	{ -- Highlight, edit, and navigate code
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		main = "nvim-treesitter.configs", -- Sets main module to use for opts
		opts = plugins.treesitter.opts,
	},
	{ -- Add indent guidelines
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		config = plugins.ibl.config,
	},

}, {
	ui = {
		-- If you are using a Nerd Font: set icons to an empty table which will use the
		-- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
		icons = vim.g.have_nerd_font and {} or {
			cmd = "⌘",
			config = "🛠",
			event = "📅",
			ft = "📂",
			init = "⚙",
			keys = "🗝",
			plugin = "🔌",
			runtime = "💻",
			require = "🌙",
			source = "📄",
			start = "🚀",
			task = "📌",
			lazy = "💤 ",
		},
	},
})
