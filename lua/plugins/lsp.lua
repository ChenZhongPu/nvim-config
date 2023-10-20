local global = require("config.global")

return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        pyright = {
          mason = false,
          autostart = false,
        },
        jedi_language_server = {},
        clangd = { mason = false },
      },
      setup = {
        -- pyright = function()
        --   require("lazyvim.util").lsp.on_attach(function(client, _)
        --     if client.name == "pyright" then
        --       -- disable hover in favor of jedi-language-server
        --       client.server_capabilities.hoverProvider = false
        --     end
        --   end)
        -- end,
      },
    },
  },
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
}
