local opt = vim.opt

-- Spell chekcing
-- https://jdhao.github.io/2019/04/29/nvim_spell_check/
-- https://vimtricks.com/p/vim-spell-check/
opt.spell = true
opt.spelllang = { "en_us", "cjk" }

local mdPath = vim.fn.stdpath("config") .. "/third-party/markdown"
local fullPath = vim.fn.expand("%:p")
local parFullPath = vim.fn.expand("%:p:h")
local fullPathWithoutType = vim.fn.expand("%:p:r")

vim.keymap.set("n", "<leader>p", function()
  vim.api.nvim_command("write")
  os.execute(
    "pandoc --pdf-engine=xelatex --highlight-style zenburn "
      .. "-H "
      .. mdPath
      .. "/head.tex "
      .. fullPath
      .. " -o "
      .. fullPathWithoutType
      .. "-export.pdf"
  )
  print("Export Markdown to PDF successfully!")
end, { desc = "📚Pandoc PDF Export" })

vim.keymap.set("n", "<leader>h", function()
  local csspath = parFullPath .. "/styling.css"
  if not vim.loop.fs_stat(csspath) then
    vim.fn.system({ "cp", mdPath .. "/styling.css", csspath })
  end
  vim.api.nvim_command("write")
  os.execute(
    "pandoc --standalone --mathjax -f markdown+emoji --css=styling.css --to=html5 "
      .. fullPath
      .. " -o "
      .. fullPathWithoutType
      .. "-export.html"
  )
  print("Export Markdown to HTML successfully!")
end, { desc = "🌐Pandoc HTML Export" })

-- add snippet
local ls = require("luasnip")
local snip = ls.snippet
local text = ls.text_node
local insert = ls.insert_node
local func = ls.function_node

local date = function()
  return { os.date("%Y-%m-%d") }
end

ls.add_snippets(nil, {
  all = {
    snip({
      trig = "meta",
      desc = "YAML metadata format for Markdown",
    }, {
      text({ "---", "title: " }),
      insert(1, "note_title"),
      text({ "", "author: " }),
      insert(2, "CHEN Zhongpu"),
      text({ "", "date: " }),
      func(date, {}),
      text({ "", "CJKmainfont: LXGW WenKai", "---" }),
      insert(0),
    }),
  },
})
