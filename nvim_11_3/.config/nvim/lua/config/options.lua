-- g = global
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

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

opt.autoindent = false
opt.tabstop = 4
opt.expandtab = true
opt.shiftwidth = 4
opt.smartindent = false

opt.clipboard = "unnamedplus"

opt.scrolloff = 8 -- keep # of spaces around cursor when scrolling

opt.hlsearch = true

opt.termguicolors = true

opt.incsearch = true

opt.updatetime = 50

opt.virtualedit = "block"

opt.inccommand = "split"

opt.ignorecase = true

opt.spell = true

-- Folding
opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
opt.foldmethod = "expr"
opt.foldenable = true
opt.foldlevel = 99 -- keep everything unfolded by default

-- Netrw
vim.g.netrw_banner = 0 -- disable banner
