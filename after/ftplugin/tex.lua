local opt = vim.opt

-- Spell chekcing
-- https://jdhao.github.io/2019/04/29/nvim_spell_check/
-- https://vimtricks.com/p/vim-spell-check/
opt.spell = true
opt.spelllang = { "en_us", "cjk" }

--- Single Shot Compile
vim.keymap.set("n", "<leader>C", ":update<CR>:VimtexCompileSS<CR>", { desc = "Latex Single Shot Compile" })

-- Copy template project
local texPath = vim.fn.stdpath("config") .. "/third-party/tex"
local fullPath = vim.fn.expand("%:p")

vim.keymap.set(
  "n",
  "<leader>ip",
  ":.-1read " .. texPath .. "/project.tex<CR>",
  { desc = "Import Project Tex Template " }
)
