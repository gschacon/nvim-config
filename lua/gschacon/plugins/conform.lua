local M = {}

M.event = { "BufWritePre" }

M.cmd = { "ConformInfo" }

M.keys = {
	{
		"<leader>f",
		function()
			require("conform").format({ async = true, lsp_format = "fallback" })
		end,
		mode = "",
		desc = "[F]ormat buffer",
	},
}

M.opts = {
	notify_on_error = false,
	format_on_save = false,
	formatters_by_ft = {
		lua = { "stylua" },
		python = {"black"},
        c = {"clang-format"},
        cpp = {"clang-format"},
        json = {"clang-format"}
	},
}

return M
