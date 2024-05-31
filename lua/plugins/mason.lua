return {
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "mypy",
        "jedi-language-server",
        -- "djlint",
        -- "ruff",
        -- "black",
        -- "ltex-ls",
      })
    end,
  },
}
