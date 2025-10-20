vim.pack.add({
    { src = 'https://github.com/hedyhli/outline.nvim' }
})

require('outline').setup({
    outline_window = {
        show_numbers = true,
        show_relative_numbers = true,
        show_symbol_details = true,
        autofold_depth = 1,
        auto_close = false,
        auto_preview = true,
        position = 'right',
        width = 25,
    },
    preview_window = {
        auto_preview = true,
    },
    guides = {
        mid_item = '├─',
        last_item = '└─',
        nested_top = '│ ',
        nested_mid = '│ ',
        nested_last = '  ',
    },
    keymaps = {
        close = { 'q', '<Esc>' },
        goto_location = '<CR>',
        focus_location = 'o',
        hover_symbol = 'K',
        toggle_preview = '<C-k>',
        rename_symbol = 'r',
        code_actions = 'a',
        fold = 'h',
        unfold = 'l',
        fold_all = 'W',
        unfold_all = 'E',
        fold_reset = 'R',
    },
    lsp_blacklist = {},
    symbol_blacklist = {},
})

vim.keymap.set('n', '<leader>o', '<cmd>Outline<CR>', { desc = 'Toggle Outline' })
