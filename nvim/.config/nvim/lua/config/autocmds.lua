-- Set colorscheme
vim.cmd('colorscheme rose-pine')

-- Highlight yanked text
vim.api.nvim_set_hl(0, 'YankHighlight', { bg = '#eb6f92' })
vim.api.nvim_create_autocmd('TextYankPost', {
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({ higroup = 'YankHighlight', timeout = 150 })
    end
})

-- Enable cursorline only in the active window
vim.api.nvim_create_autocmd({ 'WinEnter', 'BufEnter' }, {
    callback = function()
        vim.wo.cursorline = true
    end
})

vim.api.nvim_create_autocmd({ 'WinLeave', 'BufLeave' }, {
    callback = function()
        vim.wo.cursorline = false
    end
})

-- Create directories when saving files (if doesnt exist)
vim.api.nvim_create_autocmd('BufWritePre', {
    callback = function()
        local dir = vim.fn.expand('<afile>:p:h')
        if vim.fn.isdirectory(dir) == 0 then
            vim.fn.mkdir(dir, 'p')
        end
    end
})
