return {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "stylua",
        "shellcheck",
        "shfmt",
        "prettier",
        "python-lsp-server",
        "texlab",
        "grammarly-languageserver",
      },
    },
  },
}
