return {
    'MeanderingProgrammer/render-markdown.nvim',
    opts = {
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
            position = 'inline',
        },
        pipe_table = {
            style = 'normal',
            alignment_indicator = '┅'
        },
    },
}
