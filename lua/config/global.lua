local global = {}
local os_name = vim.loop.os_uname().sysname

function global:load_variables()
  self.is_mac = os_name == "Darwin"
  self.is_linux = os_name == "Linux"
  self.is_windows = os_name == "Windows_NT"
end

global:load_variables()

function File_Exists(filename)
  local stat = vim.loop.fs_stat(filename)
  return stat ~= nil and stat.type == "file"
end

C_COMPLIER = {
  c = "clang",
  cpp = "clang++",
}

return global
