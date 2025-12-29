local o = vim.opt

o.number = true
o.relativenumber = true
o.expandtab = true
o.tabstop = 4
o.shiftwidth = 4
o.smartindent = true
o.termguicolors = true
o.encoding = 'utf-8'
o.showmode = true
o.cursorline = true

-- Set the leader key to backslash
vim.g.mapleader = "\\"

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "c", "cpp" , "cc" ,"c++" , "cxx" },
  callback = function()
    vim.opt_local.tabstop = 2
    vim.opt_local.shiftwidth = 2
    vim.opt_local.softtabstop = 2
  end
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "html", "js", "css", "scss", "ts", "lua" },
  callback = function()
    vim.opt_local.tabstop = 2
    vim.opt_local.shiftwidth = 2
    vim.opt_local.softtabstop = 2
  end
})
