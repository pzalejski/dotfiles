return {
    enabled = false,
    "ibhagwan/fzf-lua",
    -- optional for icon support
    dependencies = { "nvim-tree/nvim-web-devicons" },
    -- or if using mini.icons/mini.nvim
    -- dependencies = { "echasnovski/mini.icons" },
    opts = {
    },
    config = function()
        local builtin = require('fzf-lua')
        vim.keymap.set('n', '<leader>ff', builtin.files, { desc = 'fzf-lua find files' })
        vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'fzf-lua live grep' })
        vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'fzf-lua buffers' })
        vim.keymap.set('n', '<leader>fh', builtin.helptags, { desc = 'fzf-lua help tags' })
    end,
}
