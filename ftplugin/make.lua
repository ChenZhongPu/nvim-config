-- 为Makefile文件创建导入固定模板文件的快捷键

-- 固定的模板文件路径
local template_path = vim.fn.expand("~/.config/nvim/third-party/make/Makefile")

-- 映射快捷键，仅在当前缓冲区生效
vim.api.nvim_buf_set_keymap(
  0,
  "n",
  "<Leader>im",
  ":read " .. template_path .. "<CR>",
  { noremap = true, silent = true, desc = "Import Makefile template" }
)
