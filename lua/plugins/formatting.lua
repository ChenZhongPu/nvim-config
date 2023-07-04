return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "bash",
        "c",
        "cpp",
        "cmake",
        "dockerfile",
        "vimdoc",
        "html",
        "java",
        "javascript",
        "json",
        "lua",
        "latex",
        "make",
        "markdown",
        "markdown_inline",
        "python",
        "query",
        "regex",
        "rust",
        "toml",
        "tsx",
        "typescript",
        "vim",
        "yaml",
      },
    },
  },
  -- doc string
  {
    "danymat/neogen",
    ft = { "python", "rust", "c", "cpp" },
    dependencies = "nvim-treesitter/nvim-treesitter",
    config = function()
      require("neogen").setup({})
      vim.keymap.set("n", "<leader>cD", ":lua require('neogen').generate()<CR>", {
        desc = "📄Generate Doc String",
        noremap = true,
        silent = true,
      })
    end,
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    opts = function()
      local nls = require("null-ls")
      return {
        sources = {
          nls.builtins.formatting.prettierd,
          nls.builtins.formatting.djlint,
          nls.builtins.diagnostics.hadolint, -- for Docker
          nls.builtins.formatting.taplo, -- for TOML
          nls.builtins.formatting.latexindent,
          nls.builtins.formatting.stylua,
          nls.builtins.diagnostics.ruff.with({
            -- for pep8-naming
            extra_args = { "--select", "N" },
          }),
          nls.builtins.formatting.ruff,
          nls.builtins.formatting.black,
          nls.builtins.diagnostics.mypy.with({
            extra_args = function()
              local virtual = os.getenv("VIRTUAL_ENV") or os.getenv("CONDA_DEFAULT_ENV") or "/usr"
              return { "--python-executable", virtual .. "/bin/python3" }
            end,
          }),
          -- note that the default rustfmt edition is 2015
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
