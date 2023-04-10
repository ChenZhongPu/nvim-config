vim.keymap.set("n", "<leader>R", function()
  vim.cmd("write")
  local pythonPath = function()
    local virtual = os.getenv("VIRTUAL_ENV") or os.getenv("CONDA_DEFAULT_ENV")
    if virtual then
      return virtual .. "/bin/python3"
    else
      return "/usr/bin/python3"
    end
  end
  local filePath = vim.fn.expand("%:p")
  local cmd = pythonPath() .. " " .. filePath
  vim.cmd('TermExec cmd="' .. cmd .. '"')
end, { desc = "Run Python File" })
