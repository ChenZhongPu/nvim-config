return {
  {
    "mason-org/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "jedi-language-server",
        "basedpyright",
        "codelldb",
        "bacon",
        "bacon-ls",
      })
    end,
  },
}
