vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = "*.gp",
  command = "set filetype=gnuplot",
})
