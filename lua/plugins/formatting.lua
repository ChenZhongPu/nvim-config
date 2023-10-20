return {
  -- {
  --   "nvim-treesitter/nvim-treesitter",
  --   opts = function(_, opts)
  --     if type(opts.ensure_installed) == "table" then
  --       vim.list_extend(opts.ensure_installed, { "cmake" })
  --     end
  --   end,
  -- },
  -- doc string
  {
    "danymat/neogen",
    ft = { "python", "rust", "c", "cpp" },
    dependencies = "nvim-treesitter/nvim-treesitter",
    config = function()
      require("neogen").setup({})
      vim.keymap.set("n", "<leader>cD", ":lua require('neogen').generate()<CR>", {
        desc = "🧾Generate Doc String",
        noremap = true,
        silent = true,
      })
    end,
  },
  {
    "nvimtools/none-ls.nvim",
    opts = function(_, opts)
      local nls = require("null-ls")
      table.insert(opts.sources, nls.builtins.formatting.djlint)
      -- latexindent should be installed externally
      table.insert(opts.sources, nls.builtins.formatting.latexindent)
      table.insert(
        opts.sources,
        nls.builtins.diagnostics.ruff.with({
          extra_args = { "--select", "N" },
        })
      )
      table.insert(opts.sources, nls.builtins.formatting.ruff)
      table.insert(opts.sources, nls.builtins.formatting.black)
      table.insert(
        opts.sources,
        nls.builtins.diagnostics.mypy.with({
          extra_args = function()
            local virtual = os.getenv("VIRTUAL_ENV") or os.getenv("CONDA_PREFIX") or "/usr"
            return { "--python-executable", virtual .. "/bin/python3" }
          end,
        })
      )
      table.insert(
        opts.sources,
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
            return { "--edition=2021" }
          end,
        })
      )
    end,
  },
}
