-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Togger a terminal
-- vim.keymap.set("n", "<leader>T", ":ToggleTerm<CR>", { desc = "Toggle a Terminal" })

-- Debug
vim.keymap.set("n", "<leader>B", function()
  require("dap").toggle_breakpoint()
end, {
  desc = "Toggle Breakpoint",
})
vim.keymap.set("n", "<F5>", function()
  require("dap").continue()
end)
vim.keymap.set("n", "<F10>", function()
  require("dap").step_over()
end)
vim.keymap.set("n", "<F11>", function()
  require("dap").step_into()
end)
vim.keymap.set("n", "<F12>", function()
  require("dap").step_out()
end)

-- Generate doc string
vim.keymap.set("n", "<leader>cD", ":lua require('neogen').generate()<CR>", {
  desc = "Generate Doc String",
  noremap = true,
  silent = true,
})
