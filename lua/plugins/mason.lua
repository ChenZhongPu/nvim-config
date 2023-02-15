return {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "stylua",
        "shellcheck",
        "shfmt",
        "prettier",
        "jedi-language-server",
        "flake8",
        "isort",
        "black",
        "texlab",
        "grammarly-languageserver",
        "debugpy",
      },
    },
  },
}
