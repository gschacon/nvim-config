return { -- Harpoon to jump to favorite files
	"theprimeagen/harpoon",
	config = function()
		local mark = require("harpoon.mark")
		local ui = require("harpoon.ui")
		vim.keymap.set("n", "<leader>a", mark.add_file, { desc = "[A]dd File to Harpoon" })
		vim.keymap.set("n", "<leader>h", ui.toggle_quick_menu, { desc = "Open [H]arpoon Menu" })
		vim.keymap.set("n", "<C-1>", function()
			ui.nav_file(1)
		end, { desc = "Move to File [1]" })
		vim.keymap.set("n", "<C-2>", function()
			ui.nav_file(2)
		end, { desc = "Move to File [2]" })
		vim.keymap.set("n", "<C-3>", function()
			ui.nav_file(3)
		end, { desc = "Move to File [3]" })
		vim.keymap.set("n", "<C-4>", function()
			ui.nav_file(4)
		end, { desc = "Move to File [4]" })
		vim.keymap.set("n", "<C-5>", function()
			ui.nav_file(5)
		end, { desc = "Move to File [5]" })
	end,
}
