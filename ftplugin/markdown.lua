local opt = vim.opt

-- Spell chekcing
-- https://jdhao.github.io/2019/04/29/nvim_spell_check/
-- https://vimtricks.com/p/vim-spell-check/
opt.spell = true
opt.spelllang = { "en_us", "cjk" }

local mdPath = vim.fn.stdpath("config") .. "/third-party/markdown/head.tex"

local function shell_join(args)
  return table.concat(
    vim.tbl_map(function(arg)
      return vim.fn.shellescape(arg)
    end, args),
    " "
  )
end

vim.keymap.set("n", "<leader>mp", function()
  vim.api.nvim_command("write")
  local fullPath = vim.fn.expand("%:p")
  local fullDir = vim.fn.expand("%:p:h")
  local fullPathWithoutType = vim.fn.expand("%:p:r")
  local resourcePathSeparator = vim.fn.has("win32") == 1 and ";" or ":"
  local resourcePath = table.concat({ fullDir, vim.fn.getcwd() }, resourcePathSeparator)
  local command = shell_join({
    "pandoc",
    "--pdf-engine=xelatex",
    "--syntax-highlighting",
    "zenburn",
    "--resource-path=" .. resourcePath,
    "-H",
    mdPath,
    fullPath,
    "-o",
    fullPathWithoutType .. "-export.pdf",
  })
  local output = vim.fn.system(command)
  if vim.v.shell_error == 0 then
    print("Export Markdown to PDF successfully!")
  else
    vim.notify("Failed to export Markdown to PDF.\n" .. output, vim.log.levels.ERROR)
  end
end, { buffer = true, desc = "Pandoc PDF Export" })
