-- Copy template project
local cmakePath = vim.fn.stdpath("config") .. "/third-party/cmake"

vim.keymap.set(
  "n",
  "<leader>ip",
  ":.-1read " .. cmakePath .. "/bin.txt<CR>",
  { desc = "Import CMake Project Executable Template" }
)
