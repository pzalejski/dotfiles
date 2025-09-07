-- Set both the normal window nad floating window background colors to transparent / none
vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
vim.api.nvim_set_hl(0, 'NormalNC', { bg = 'none' })

-- Set custom color for cursorline
vim.api.nvim_set_hl(0, 'cursorline', { bg = '#2a282f' })
