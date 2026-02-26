-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.opt.spelllang = { "en_us", "cjk" }

vim.wo.wrap = true
vim.wo.linebreak = true

vim.wo.foldmethod = "expr"
vim.o.foldlevelstart = 10
vim.wo.foldexpr = "nvim_treesitter#foldexpr()"

vim.opt.clipboard = "unnamedplus"

vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    local copy_to_unnamedplus = require("vim.ui.clipboard.osc52").copy("+")
    copy_to_unnamedplus(vim.v.event.regcontents)
    local copy_to_unnamed = require("vim.ui.clipboard.osc52").copy("*")
    copy_to_unnamed(vim.v.event.regcontents)
  end,
})

vim.g.lazyvim_picker = "fzf"

vim.g.lazyvim_rust_diagnostics = "bacon-ls"

vim.g.lazyvim_python_lsp = "basedpyright"
