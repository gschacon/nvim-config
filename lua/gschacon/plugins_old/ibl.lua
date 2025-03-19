local M = {}

M.config = function()
	require("ibl").setup({ indent = { char = { "┆" } } })
end

return M
