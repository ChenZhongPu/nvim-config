return {
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        -- "djlint",
        -- "ruff",
        -- "black",
        "ltex-ls",
      })
    end,
  },
}
