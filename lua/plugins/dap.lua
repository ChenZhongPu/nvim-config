return {
  {
    "theHamsta/nvim-dap-virtual-text",
    ft = { "python", "rust", "c", "cpp" },
    dependencies = { "mfussenegger/nvim-dap" },
  },
  {
    "rcarriga/nvim-dap-ui",
    ft = { "python", "rust", "c", "cpp" },
    dependencies = { "mfussenegger/nvim-dap" },
    config = function()
      local dap, dapui = require("dap"), require("dapui")
      dapui.setup()
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
        vim.cmd([[Neotree close]])
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
        vim.cmd([[Neotree show]])
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
        vim.cmd([[Neotree show]])
      end
    end,
  },
  {
    "mfussenegger/nvim-dap",
    ft = { "python", "rust", "c", "cpp" },
    config = function()
      require("nvim-dap-virtual-text").setup({ commented = true })
      local dap = require("dap")
      dap.adapters.python = {
        type = "executable",
        command = os.getenv("HOME") .. "/.local/share/nvim/mason/packages/debugpy/venv/bin/python",
        args = { "-m", "debugpy.adapter" },
      }
      dap.configurations.python = {
        {
          -- The first three options are required by nvim-dap
          type = "python", -- the type here established the link to the adapter definition: `dap.adapters.python`
          request = "launch",
          name = "Launch file",

          -- Options below are for debugpy, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for supported options
          program = "${file}", -- This configuration will launch the current file if used.
          pythonPath = function()
            local virtual = os.getenv("VIRTUAL_ENV") or os.getenv("CONDA_DEFAULT_ENV")
            if virtual then
              return virtual .. "/bin/python3"
            else
              return "/usr/bin/python3"
            end
          end,
        },
      }
      local port = 13000
      dap.adapters.codelldb = {
        type = "server",
        port = port,
        executable = {
          command = vim.env.HOME .. "/.local/share/nvim/mason/packages/codelldb/extension/adapter/codelldb",
          args = { "--port", port },
        },
      }
      -- local lldb_path = function()
      --   if global.is_mac then
      --     return "/opt/homebrew/opt/llvm/bin/"
      --   end
      --   return "/usr/bin/"
      -- end
      -- dap.adapters.lldb = {
      --   type = "executable",
      --   command = lldb_path() .. "lldb-vscode", -- adjust as needed, must be absolute path
      --   name = "lldb",
      -- }
      dap.configurations.rust = {
        {
          name = "Launch file",
          -- name = "Launch",
          type = "codelldb",
          -- type = "lldb",
          request = "launch",
          program = function()
            -- for Rust, it should managed by Cargo
            return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/target/debug/", "file")
          end,
          cwd = "${workspaceFolder}",
          stopOnEntry = false,
        },
      }
      dap.configurations.c = {
        {
          name = "Launch file",
          type = "codelldb",
          request = "launch",
          program = function()
            if not File_Exists("CMakeLists.txt") then
              local filePath = vim.fn.expand("%:p")
              local compile = C_COMPLIER[vim.bo.filetype] .. " -o build-debug " .. filePath .. " -g -Wall"
              os.execute(compile)
              return vim.fn.getcwd() .. "/build-debug"
            else
              -- it is CMake project
              os.execute("cmake -B debug -DCMAKE_BUILD_TYPE=Debug .")
              os.execute("cmake --build debug")
              return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/debug/", "file")
            end
          end,
          cwd = "${workspaceFolder}",
          stopOnEntry = false,
        },
      }
      dap.configurations.cpp = dap.configurations.c
    end,
  },
}
