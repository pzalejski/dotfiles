vim.pack.add({
    { src = 'https://github.com/rose-pine/neovim' }
})

require('rose-pine').setup({
    enable = {
        termina = true
    },
    dim_inactive_windows = true,
    extend_background_behind_borders = true,
    styles = {
        bold = true,
        italic = true,
        transparency = true -- keep enabled for popup windows
    }
})
