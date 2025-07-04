vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

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

opt.scrolloff = 999 -- keep the cursor centered on screen when scrollnig

opt.hlsearch = true

opt.termguicolors = true

opt.incsearch = true

opt.updatetime = 50

opt.virtualedit = "block"

opt.inccommand = "split"

opt.ignorecase = true
