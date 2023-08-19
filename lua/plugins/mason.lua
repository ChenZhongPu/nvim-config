return {
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "djlint",
        "ruff",
        "black",
        "debugpy",
        -- "texlab",
        "ltex-ls",
        -- "hadolint",
        -- "taplo",
        -- "codelldb",
        -- "cmake-language-server",
        -- "rust-analyzer",
      })
    end,
  },
}
