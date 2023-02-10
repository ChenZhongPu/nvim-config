-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Togger a terminal
vim.keymap.set("n", "<leader>T", ":ToggleTerm<CR>", { desc = "Toggle A Terminal" })
