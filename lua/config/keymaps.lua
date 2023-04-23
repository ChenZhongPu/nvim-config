-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Debug
vim.keymap.set("n", "<leader>B", function()
  require("dap").toggle_breakpoint()
end, {
  desc = "🐛Toggle Debug Breakpoint",
})
vim.keymap.set("n", "<leader>S", function()
  require("dap").terminate()
end, {
  desc = "🛑Terminate Debug",
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

-- Toggle current line blames
vim.keymap.set("n", "<leader>gT", "<cmd>Gitsigns toggle_current_line_blame<cr>", {
  desc = "Toggle Gitsigns Current Line Blame",
})

-- disable codeim key binding to accept the suggnestion
-- vim.g.codeium_no_map_tab = 1

vim.keymap.set("i", "<M-[>", function()
  require("copilot.suggestion").prev()
end)

vim.keymap.set("i", "<M-]>", function()
  require("copilot.suggestion").next()
end)

vim.keymap.set("i", "<M-l>", function()
  require("copilot.suggestion").accept()
end)

vim.keymap.set("i", "<C-]>", function()
  require("copilot.suggestion").dismiss()
end)
