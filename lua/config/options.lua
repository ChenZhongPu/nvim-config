-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.opt.spelllang = { "en_us", "cjk" }

vim.wo.wrap = true
vim.wo.linebreak = true

vim.wo.foldmethod = "expr"
vim.o.foldlevelstart = 10
vim.wo.foldexpr = "nvim_treesitter#foldexpr()"

-- vim.o.tabstop = 4
-- vim.o.shiftwidth = 4
-- vim.o.softtabstop = 4
-- vim.o.expandtab = true
