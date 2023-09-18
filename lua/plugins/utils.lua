return {
  {
    "akinsho/toggleterm.nvim",
    event = "BufReadPost",
    keys = { { "<leader>T", "<cmd>ToggleTerm<cr>", desc = "Toggle a Terminal" } },
    config = function()
      require("toggleterm").setup()
    end,
  },
  -- AI Code
  -- {
  --   "Exafunction/codeium.vim",
  --   event = "InsertEnter",
  --   config = function()
  --     vim.keymap.set("i", "<C-g>", function()
  --       return vim.fn["codeium#Accept"]()
  --     end, { expr = true })
  --   end,
  -- },
  -- add codeium status line
  -- {
  --   "nvim-lualine/lualine.nvim",
  --   event = "VeryLazy",
  --   opts = function(_, opts)
  --     table.insert(opts.sections.lualine_x, function()
  --       return "🤖" .. vim.fn["codeium#GetStatusString"]()
  --     end)
  --   end,
  -- },
  {
    "simrat39/symbols-outline.nvim",
    cmd = "SymbolsOutline",
    keys = { { "<leader>cs", "<cmd>SymbolsOutline<cr>", desc = "🌲Symbols Outline" } },
    opts = {
      -- add your options that should be passed to the setup() function here
      position = "right",
    },
  },
  {
    "nvim-lualine/lualine.nvim",
    -- remove time
    opts = function(_, opts)
      opts.sections.lualine_z = {}
    end,
  },
}
