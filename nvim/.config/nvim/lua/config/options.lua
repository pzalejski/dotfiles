-- g = global
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.g.netrw_liststyle = 0

-- diagnostics
vim.diagnostic.config({ virtual_text = true })

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

-- Set both the Normal window and floating window background colors to transparent / none
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

-- Non-Focused
vim.api.nvim_set_hl(0, "NormalNC", { bg = "#191724" })

