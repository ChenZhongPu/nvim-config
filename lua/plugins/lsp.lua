local global = require("config.global")

return {
  {
    "lervag/vimtex",
    init = function()
      vim.g.vimtex_quickfix_open_on_warning = 0
      if global.is_mac then
        vim.g.vimtex_view_method = "skim"
        vim.g.vimtex_view_skim_sync = 1
        vim.g.vimtex_view_skim_activate = 1
        vim.g.vimtex_view_skim_reading_bar = 1
      end
      if global.is_linux then
        vim.g.vimtex_view_method = "zathura"
      end
    end,
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        jedi_language_server = {},
        clojure_lsp = {},
      },
      setup = {
        pyright = function()
          require("lazyvim.util").lsp.on_attach(function(client, _)
            if client.name == "pyright" then
              -- disable hover in favor of jedi-language-server
              client.server_capabilities.hoverProvider = false
            end
          end)
        end,
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      opts.highlight.disable = { "latex" }
    end,
  },
}
