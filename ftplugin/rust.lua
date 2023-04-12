vim.keymap.set("n", "<leader>R", function()
  vim.cmd("write")
  require("rust-tools").runnables.runnables()
end, { desc = "🦀Run Rust Project" })
