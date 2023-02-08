local global = require("config.global")

return {
  {
    "lervag/vimtex",
    opt = true,
    config = function()
      vim.g.tex_flavor = "latex"
      if global.is_mac then
        vim.g.vimtex_view_method = "skim"
        vim.g.vimtex_view_skim_sync = 1
        vim.g.vimtex_view_skim_activate = 1
        vim.g.vimtex_view_reading_bar = 1
      end
      if global.is_linux then
        vim.g.vimtex_view_general_viewer = "okular"
        vim.g.vimtex_view_general_options = [[--unique file:@pdf\#src:@line@tex]]
      end
    end,
  },
}
