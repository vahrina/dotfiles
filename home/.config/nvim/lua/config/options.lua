-- default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

local opt = vim.opt

opt.cursorline = true
opt.expandtab = true
opt.smartindent = true
opt.shiftwidth = 2
opt.tabstop = 2
opt.number = true
opt.relativenumber = true
opt.termguicolors = true
opt.cmdheight = 0
opt.signcolumn = "yes"
opt.wrap = true
opt.undofile = true
opt.swapfile = false
opt.list = true
opt.listchars = { tab = "→ ", trail = "·", nbsp = "␣" }
vim.o.showcmd = true
vim.o.showcmdloc = "statusline"
