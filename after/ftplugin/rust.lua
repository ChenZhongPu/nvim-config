vim.keymap.set("n", "<leader>R", function()
  require("rust-tools").runnables.runnables()
end, { desc = "Run Rust Project" })
