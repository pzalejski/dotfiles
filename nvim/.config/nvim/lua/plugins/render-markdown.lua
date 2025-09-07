vim.pack.add({
    { src = 'https://github.com/MeanderingProgrammer/render-markdown.nvim' }
})

require('render-markdown').setup({
    code = {
        enabled = false
    },
    bullet = {
        enabled = true
    },
    checkbox = {
        enabled = true,
        unchecked = {
            icon = '✘ ',
            highlight = 'RenderMarkdownUnchecked',
            scope_highlight = nil
        },
        checked = {
            icon = '✔ ',
            highlight = 'RenderMarkdownChecked',
            scope_highlight = nil
        },
        custom = { todo = { raw = '[-]', rendered = '◯ ' } },
    },
    heading = {
        position = 'inline'
    },
    pipe_table = {
        style = 'normal',
        alignment_indicator = '┅'
    },
})
