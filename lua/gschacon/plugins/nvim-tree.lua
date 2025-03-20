return {
	"nvim-tree/nvim-tree.lua",

	version = "*",
	lazy = false,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		-- Mappings when inside nvim-tree
		local function my_on_attach(bufnr)
			local api = require("nvim-tree.api")

			local function opts(desc)
				return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
			end

			api.config.mappings.default_on_attach(bufnr)

			vim.keymap.set("n", "<Esc>", api.tree.close, opts("Close"))
			vim.keymap.set("n", "?", api.tree.toggle_help, opts("Help"))
			vim.keymap.set("n", "h", api.tree.toggle_help, opts("Help"))
			vim.keymap.set("n", "e", api.tree.expand_all, opts("Expand All"))
			vim.keymap.set("n", "w", api.tree.collapse_all, opts("Expand All"))
		end

		require("nvim-tree").setup({
			view = {
				float = {
					enable = true,
					open_win_config = function()
						local screen_w = vim.opt.columns:get()
						local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
						local window_w = math.floor(screen_w * 0.5)
						local window_h = math.floor(screen_h * 0.8)
						local center_x = math.floor((screen_w - window_w) / 2)
						local center_y = math.floor((screen_h - window_h) / 2)
						return {
							border = "rounded",
							relative = "editor",
							row = center_y,
							col = center_x,
							width = window_w,
							height = window_h,
						}
					end,
				},
			},
			hijack_directories = {
				enable = false,
				auto_open = false,
			},
            -- Hide .git folder on tree
			filters = { custom = { "^.git$" } },
			on_attach = my_on_attach,
            hijack_netrw = false,
            actions = {
                open_file = {
                    window_picker = { chars = "1234567890ABCDEFGHIJKLMNOPQRSTUVWXYZ"
                    }
                } 
            }
		})

		-- General keymaps
		vim.keymap.set("n", "<leader>nt", ":NvimTreeToggle<CR>", { desc = "Open [N]vim [T]ree" })

		-- Resize on based on window size
		local tree_api = require("nvim-tree")
		local tree_view = require("nvim-tree.view")

		vim.api.nvim_create_augroup("NvimTreeResize", {
			clear = true,
		})

		vim.api.nvim_create_autocmd({ "VimResized" }, {
			group = "NvimTreeResize",
			callback = function()
				if tree_view.is_visible() then
					tree_view.close()
					tree_api.open()
				end
			end,
		})

		-- Open nvim-tree on startup only when opening directories and no name buffers
		local function open_nvim_tree(data)
			-- buffer is a directory
			local directory = vim.fn.isdirectory(data.file) == 1

			if not directory then
				return
			end

			-- change to the directory
			vim.cmd.cd(data.file)

			-- open the tree
			require("nvim-tree.api").tree.open({ current_window = false })
		end
		vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })
	end,
}
