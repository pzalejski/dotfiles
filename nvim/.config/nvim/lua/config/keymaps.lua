require('config.md_keymaps')

local set = vim.keymap.set

-- Basic movement keybinds navigating splits
set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move to bottom window' })
set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move to top window' })
set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move to right window' })
set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move to left window' })

-- File Search / Live Grep
set('n', '<leader>f', ':Pick files<CR>', { desc = 'File Search' })
set('n', '<leader>/', ':Pick grep_live<CR>', { desc = 'Grep Search' })
set('n', '<leader>.', ':Pick buffers<CR>', { desc = 'Buffer Search' })
set('n', 'M-S-/', ':Pick help<CR>', { desc = 'Help' })

-- Buffer navigation
set('n', '<leader>bn', ':bnext<CR>', { desc = 'Next buffer' })
set('n', '<leader>bp', ':bprevious<CR>', { desc = 'Previous buffer' })
set('n', '<leader>bd', ':bdelete<CR>', { desc = 'Close buffer/tab' })

-- Keep cursor centered when jumping or searching
set('n', '<C-d>', '<C-d>zz', { desc = 'Half page down (centered)' })
set('n', '<C-u>', '<C-u>zz', { desc = 'Half page up (centered)' })
set('n', 'n', 'nzzzv', { desc = 'Next search result (centered)' })
set('n', 'N', 'Nzzzv', { desc = 'Previous search result (centered)' })

-- Move highlighted lines
set('v', 'J', ":m '>+1<CR>gv=gv", { desc = 'Move selected lines down' })
set('v', 'K', ":m '<-2<CR>gv=gv", { desc = 'Move selected linese up' })

-- Window resizing & splitting
set('n', '<leader>sv', ':vsplit<CR>', { desc = 'Split window vertically' })
set('n', '<leader>sh', ':split<CR>', { desc = 'Split window horizontally' })
set('n', '<C-Up>', ':resize +2<CR>', { desc = 'Increase window height' })
set('n', '<C-Down>', ':resize -2<CR>', { desc = 'Decrease window height' })
set('n', '<C-Right>', ':vertical resize +2<CR>', { desc = 'Decrease window width' })
set('n', '<C-Left>', ':vertical resize -2<CR>', { desc = 'Decrease window width' })

set('n', 'Q', '<nop>')

-- Fugitive / Git
set('n', '<leader>gs', vim.cmd.Git)
