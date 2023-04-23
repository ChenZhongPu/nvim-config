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
          visible = true, -- This is what you want: If you set this to `true`, all "hide" just mean "dimmed out"
          hide_dotfiles = false,
          hide_gitignored = false,
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
  -- {
  --   "nvim-lualine/lualine.nvim",
  --   event = "VeryLazy",
  --   opts = function(_, opts)
  --     table.insert(opts.sections.lualine_x, function()
  --       return "🤖" .. require("copilot.api").status.data.status
  --     end)
  --   end,
  -- },
}
