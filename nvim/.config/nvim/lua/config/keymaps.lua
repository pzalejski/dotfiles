local set = vim.keymap.set

-- Basic movement keybinds navigating splits
set("n", "<C-j>", "<C-w><C-j>")
set("n", "<C-k>", "<C-w><C-k>")
set("n", "<C-l>", "<C-w><C-l>")
set("n", "<C-h>", "<C-w><C-h>")

-- Keep cursor centered when jumping or searching
set("n", "<C-d>", "<C-d>zz")
set("n", "<C-u>", "<C-u>zz")
set("n", "n", "nzzzv")
set("n", "N", "Nzzzv")

-- Move highlighted lines
set("v", "J", ":m '>+1<CR>gv=gv")
set("v", "K", ":m '<-2<CR>gv=gv")

-- Window resizing
set('n', '<C-Up>',    ':resize -2<CR>')
set('n', '<C-Down>',  ':resize +2<CR>')
set('n', '<C-Left>',  ':vertical resize -2<CR>')
set('n', '<C-Right>', ':vertical resize +2<CR>')

set("n", "Q", "<nop>")
