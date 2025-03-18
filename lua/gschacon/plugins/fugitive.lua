local M = {}

M.config = function()
    vim.keymap.set("n", "<leader>gs", vim.cmd.Git, {desc = "[G]it [S]tatus"})
end

return M
