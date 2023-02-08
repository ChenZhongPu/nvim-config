local mdPath = vim.fn.stdpath("config") .. "/third-party/markdown"
local fullPath = vim.fn.expand("%:p")
local parFullPath = vim.fn.expand("%:p:h")
local fullPathWithoutType = vim.fn.expand("%:p:r")

vim.keymap.set("n", "<leader>p", function()
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
end, { desc = "Pandoc PDF Export" })

vim.keymap.set("n", "<leader>h", function()
  local csspath = parFullPath .. "/styling.css"
  if not vim.loop.fs_stat(csspath) then
    vim.fn.system({ "cp", mdPath .. "/styling.css", csspath })
  end
  os.execute(
    "pandoc --standalone --mathjax -f markdown+emoji --css=styling.css --to=html5 "
      .. fullPath
      .. " -o "
      .. fullPathWithoutType
      .. "-export.html"
  )
  print("Export Markdown to HTML successfully!")
end, { desc = "Pandoc HTML Export" })
