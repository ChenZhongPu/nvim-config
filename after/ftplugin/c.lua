vim.keymap.set("n", "<leader>R", function()
  vim.cmd("write")
  local filePath = vim.fn.expand("%:p")
  local compile = "clang -o build-foo " .. filePath .. " -Wall"
  local cmd = compile .. " && ./build-foo"
  vim.cmd('TermExec cmd="' .. cmd .. '"')
end, { desc = "Run C/C++ File" })
