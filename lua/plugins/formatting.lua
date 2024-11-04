return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        clojure = { "joker" },
      },
    },
  },
  {
    "mfussenegger/nvim-lint",
    opts = {
      linters_by_ft = {
        clojure = { "joker" },
      },
    },
  },
}
