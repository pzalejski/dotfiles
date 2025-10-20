require('config.md_keymaps')

local set = vim.keymap.set

set('n', 'Q', '<nop>')

-- Basic movement keybinds navigating splits
set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move to bottom window' })
set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move to top window' })
set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move to right window' })
set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move to left window' })

-- File Search / Live Grep
set('n', '<leader>e', ':lua MiniFiles.open()<CR>', { desc = 'Open file explorer' })
set('n', '<leader>f', ':Pick files<CR>', { desc = 'File Search' })
set('n', '<leader>/', ':Pick grep_live<CR>', { desc = 'Grep Search' })
set('n', '<leader>.', ':Pick buffers<CR>', { desc = 'Buffer Search' })
-- set('n', 'M-S-/', ':Pick help<CR>', { desc = 'Help' })

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

-- Trouble
set('n', '<leader>xx', '<cmd>Trouble diagnostics toggle<cr>',
    { desc = 'Diagnostics (Trouble)' })
set('n', '<leader>xX', '<cmd>Trouble diagnostics toggle filter.buf=0<cr>',
    { desc = 'Buffer Diagnostics (Trouble)' })
set('n', '<leader>cs', '<cmd>Trouble symbols toggle focus=false<cr>',
    { desc = 'Symbols (Trouble)' })
set('n', '<leader>cl', '<cmd>Trouble lsp toggle focus=false win.position=right<cr>',
    { desc = 'LSP Definitions / references / ... (Trouble)' })
set('n', '<leader>xL', '<cmd>Trouble loclist toggle<cr>',
    { desc = 'Location List (Trouble)' })
set('n', '<leader>xQ', '<cmd>Trouble qflist toggle<cr>',
    { desc = 'Quickfix List (Trouble)' })

-- Fugitive / Git
set('n', '<leader>gs', vim.cmd.Git)

-- Copilot
set('i', '<M-w>', '<Plug>(copilot-accept-word)')
set('i', '<M-n>', '<Plug>(copilot-accept-line)')

-- Outline
set('n', '<leader>o', '<cmd>Outline<CR>', { desc = 'Toggle Outline' })
