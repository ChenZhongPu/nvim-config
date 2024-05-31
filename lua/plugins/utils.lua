return {
  {
    "nvim-lualine/lualine.nvim",
    -- remove time
    opts = function(_, opts)
      opts.sections.lualine_z = {}
    end,
  },
}
