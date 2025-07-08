local set = vim.keymap.set

-- Basic movement keybinds navigating splits
set("n", "<C-j>", "<C-w><C-j>")
set("n", "<C-k>", "<C-w><C-k>")
set("n", "<C-l>", "<C-w><C-l>")
set("n", "<C-h>", "<C-w><C-h>")

-- Window resizing
set('n', '<C-Up>',    ':resize -2<CR>')
set('n', '<C-Down>',  ':resize +2<CR>')
set('n', '<C-Left>',  ':vertical resize -2<CR>')
set('n', '<C-Right>', ':vertical resize +2<CR>')
