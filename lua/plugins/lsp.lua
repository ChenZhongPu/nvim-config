local global = require("config.global")

return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        clangd = {
          mason = false,
        }, -- for C, C++. Note that `clangd` is shipped with OS.
      },
      setup = {
        clangd = function(_, opts)
          opts.capabilities.offsetEncoding = { "utf-16" } -- avoid clangd error with copilot
        end,
        rust_analyzer = function(_, opts)
          opts.settings = {
            ["rust-analyzer"] = {
              checkOnSave = {
                command = "clippy",
              },
            },
          }
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
}
