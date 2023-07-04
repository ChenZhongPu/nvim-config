return {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "prettierd",
        "stylua",
        "shellcheck",
        "shfmt",
        "djlint",
        "jedi-language-server",
        "mypy",
        "ruff",
        "ruff-lsp",
        "black",
        "texlab",
        "ltex-ls",
        "debugpy", -- for Python debugger
        "hadolint", -- for Docker
        "taplo", -- for TOML
        "codelldb", -- no need vscode, for C, C++, Rust
        "cmake-language-server",
        "rust-analyzer",
      },
    },
  },
}
