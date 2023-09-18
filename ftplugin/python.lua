vim.keymap.set("n", "<leader>R", function()
  vim.cmd("write")
  local filePath = vim.fn.expand("%:p")
  local cmd = "python3" .. " " .. filePath
  vim.cmd('TermExec cmd="' .. cmd .. '"')
end, { desc = "🐍Run Python File" })
