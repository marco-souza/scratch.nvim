--- Editor settings module

-- line numbers
vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.splitbelow = true
vim.opt.splitright = true

-- text wrap
vim.opt.wrap = false

-- tabs
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 0 -- fallback to tabstop

-- clipboard
vim.opt.clipboard = "unnamedplus"

-- padding
vim.opt.scrolloff = 999

--- visual editor
vim.opt.virtualedit = "block"

--- inccommand
vim.opt.inccommand = "split"

--- ignorecase for searching commands
vim.opt.ignorecase = true

--- terminal colors
vim.opt.termguicolors = true

-- fold
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldlevelstart = 2

-- persistent undo
vim.opt.undodir = vim.fn.expand("~/.config/nvim.undo")
vim.opt.undofile = true

-- leader
vim.g.mapleader = " "

-- set up diagnostics
vim.diagnostic.config({
  virtual_text = true,
})
