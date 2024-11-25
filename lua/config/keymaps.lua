-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- vim.keymap.set("n", "<F5>", function()
--   require("dap").continue()
-- end)
-- vim.keymap.set("n", "<F10>", function()
--   require("dap").step_over()
-- end)
-- vim.keymap.set("n", "<F11>", function()
--   require("dap").step_into()
-- end)
-- vim.keymap.set("n", "<F12>", function()
--   require("dap").step_out()
-- end)

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
