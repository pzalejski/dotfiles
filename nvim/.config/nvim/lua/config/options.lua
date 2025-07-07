-- g = global
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- opt = options
local opt = vim.opt

opt.number = true
opt.relativenumber = true
opt.numberwidth = 4

opt.splitbelow = true
opt.splitright = true

opt.wrap = false

opt.tabstop = 4
opt.expandtab = true
opt.shiftwidth = 4
opt.smartindent = true

opt.clipboard = "unnamedplus"

opt.scrolloff = 8 -- keep # of spaces around cursor when scrolling

opt.hlsearch = true

opt.termguicolors = true

opt.incsearch = true

opt.updatetime = 50

opt.virtualedit = "block"

opt.inccommand = "split"

opt.ignorecase = true
