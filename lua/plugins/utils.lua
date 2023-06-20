return {
  {
    "akinsho/toggleterm.nvim",
    event = "BufReadPost",
    keys = { { "<leader>T", "<cmd>ToggleTerm<cr>", desc = "⌨⌨Toggle a Terminal" } },
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
  -- To show hidden items
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      filesystem = {
        bind_to_cwd = false,
        follow_current_file = true,
        use_libuv_file_watcher = true,
        filtered_items = {
          hide_dotfiles = false,
        },
      },
    },
  },
  -- End: to show hidden items using neo-tree
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
    "stevearc/aerial.nvim",
    ft = { "python", "rust", "c", "cpp", "tex", "markdown" },
    event = "BufReadPost",
    opts = {},
    -- Optional dependencies
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
  },
  {
    "lvimuser/lsp-inlayhints.nvim",
    ft = { "rust" },
    config = function()
      require("lsp-inlayhints").setup()
    end,
  },
}
