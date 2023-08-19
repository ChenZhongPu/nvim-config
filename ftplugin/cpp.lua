vim.keymap.set("n", "<leader>R", function()
  vim.cmd("write")
  local filePath = vim.fn.expand("%:p")
  local compile = "clang++ -o build-foo " .. filePath .. " -Wall"
  local cmd = compile .. " && ./build-foo"
  vim.cmd('TermExec cmd="' .. cmd .. '"')
end, { desc = "💀Run C/C++ File" })

vim.keymap.set("n", "<leader>dG", function()
  vim.cmd("write")
  local filePath = vim.fn.expand("%:p")
  local compile = "clang++ -o build-debug " .. filePath .. " -g -Wall"
  os.execute(compile)
end, { desc = "🐛Generate Single C Debug File" })
