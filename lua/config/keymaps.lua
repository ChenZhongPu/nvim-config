-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

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

-- Toggle current line blames
vim.keymap.set("n", "<leader>gT", "<cmd>Gitsigns toggle_current_line_blame<cr>", {
  desc = "Toggle Gitsigns Current Line Blame",
})

-- disable codeim key binding
vim.g.codeium_disable_bindings = 1

-- disable Ctrl-n
vim.keymap.set("i", "<C-n>", "<Nop>", { noremap = true, silent = true, nowait = true })
-- disable Ctrl-m
vim.keymap.set("i", "<C-m>", "<Nop>", { noremap = true, silent = true, nowait = true })
-- Somehow <CR> not work: use <C-j> instead
