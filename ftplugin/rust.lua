vim.keymap.set("n", "<leader>R", function()
  vim.cmd("write")
  vim.cmd('TermExec cmd="cargo run"')
end, { desc = "🦀Run Rust Project" })
