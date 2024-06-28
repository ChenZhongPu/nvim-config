local opt = vim.opt

-- Spell chekcing
-- https://jdhao.github.io/2019/04/29/nvim_spell_check/
-- https://vimtricks.com/p/vim-spell-check/
opt.spell = true
opt.spelllang = { "en_us", "cjk" }

local mdPath = vim.fn.stdpath("config") .. "/third-party/markdown/head.tex"
local fullPath = vim.fn.expand("%:p")
local fullPathWithoutType = vim.fn.expand("%:p:r")

vim.keymap.set("n", "<leader>mp", function()
  vim.api.nvim_command("write")
  local command = string.format(
    "pandoc --pdf-engine=xelatex --highlight-style zenburn -H %s %s -o %s-export.pdf",
    mdPath,
    fullPath,
    fullPathWithoutType
  )
  local success = os.execute(command)
  if success then
    print("Export Markdown to PDF successfully!")
  else
    print("Failed to export Markdown to PDF.")
  end
end, { desc = "Pandoc PDF Export" })
