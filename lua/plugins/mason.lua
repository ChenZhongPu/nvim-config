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
        "mypy",
        "texlab",
        "ltex-ls",
        "debugpy",
        "hadolint", -- for Docker
        "taplo", -- for TOML
        "codelldb", -- no need vscode, for C, C++, Rust
        -- "cmake-language-server",
      },
    },
  },
}
