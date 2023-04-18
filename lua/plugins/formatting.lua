return {
  {
    "nvim-treesitter/nvim-treesitter",
    ensure_installed = {
      "bash",
      "c",
      "dockerfile",
      "help",
      "html",
      "java",
      "javascript",
      "json",
      "lua",
      "latex",
      "make",
      "markdown",
      "markdown_inline",
      "cmake",
      "python",
      "query",
      "regex",
      "rust",
      "tsx",
      "typescript",
      "vim",
      "yaml",
    },
  },
  -- doc string
  {
    "danymat/neogen",
    ft = { "python", "rust", "c" },
    dependencies = "nvim-treesitter/nvim-treesitter",
    config = true,
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    opts = function()
      local nls = require("null-ls")
      return {
        sources = {
          nls.builtins.formatting.prettier,
          nls.builtins.diagnostics.hadolint, -- for Docker
          nls.builtins.formatting.taplo, -- for TOML
          nls.builtins.formatting.latexindent,
          nls.builtins.formatting.stylua,
          nls.builtins.diagnostics.flake8,
          nls.builtins.formatting.isort,
          nls.builtins.formatting.black,
          nls.builtins.diagnostics.mypy,
          nls.builtins.formatting.rustfmt.with({
            extra_args = function(params)
              local Path = require("plenary.path")
              local cargo_toml = Path:new(params.root .. "/" .. "Cargo.toml")

              if cargo_toml:exists() and cargo_toml:is_file() then
                for _, line in ipairs(cargo_toml:readlines()) do
                  local edition = line:match([[^edition%s*=%s*%"(%d+)%"]])
                  if edition then
                    return { "--edition=" .. edition }
                  end
                end
              end
              -- default edition when we don't find `Cargo.toml` or the `edition` in it.
              return { "--edition=2021" }
            end,
          }),
        },
      }
    end,
  },
}
