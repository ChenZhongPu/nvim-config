local global = require("config.global")

return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        ltex = {},
        clangd = {
          mason = false,
        }, -- for C, C++. Note that `clangd` is shipped with OS.
      },
      setup = {
        clangd = function(_, opts)
          opts.capabilities.offsetEncoding = { "utf-16" } -- avoid clangd error with copilot
        end,
      },
    },
  },
  {
    "lervag/vimtex",
    ft = { "tex", "bib" },
    config = function()
      vim.g.tex_flavor = "latex"
      if global.is_mac then
        vim.g.vimtex_view_method = "skim"
        vim.g.vimtex_view_skim_sync = 1
        vim.g.vimtex_view_skim_activate = 1
        vim.g.vimtex_view_reading_bar = 1
      end
      if global.is_linux then
        vim.g.vimtex_view_method = "zathura"
      end
    end,
  },
  {
    "simrat39/rust-tools.nvim",
    ft = { "rust" },
    config = function()
      local rt = require("rust-tools")
      local extention_path = vim.env.HOME .. "/.local/share/nvim/mason/packages/codelldb/extension"
      local codelldb_path = extention_path .. "/adapter/codelldb"
      local ddl_suffix = function()
        if global.is_mac then
          return ".dylib"
        else
          return ".so" -- linux
        end
      end
      local liblldb_path = extention_path .. "/lldb/lib/liblldb" .. ddl_suffix()
      rt.setup({
        dap = {
          adapter = require("rust-tools.dap").get_codelldb_adapter(codelldb_path, liblldb_path),
        },
        server = {
          on_attach = function(_, buffer)
            vim.keymap.set(
              "n",
              "<Leader>a",
              rt.hover_actions.hover_actions,
              { buffer = buffer, desc = "👋🦀Rust Tools Hover Actions" }
            )
          end,
          settings = {
            ["rust-analyzer"] = {
              -- enable clippy on save
              checkOnSave = {
                command = "clippy",
              },
            },
          },
        },
      })
    end,
  },
}
